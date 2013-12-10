<?php require_once 'engine/init.php'; include 'layout/overall/header.php'; ?> 
<div class="inner">
        <form action="spells.php#" method="post">
            <select name="selected">
            <option value="0">All</option>
            <option value="1">Sorcerers</option>
            <option value="2">Druids</option>
            <option value="3">Paladins</option>
            <option value="4">Knights</option>
            </select>
            <input type="submit" value="Sort by Vocation">
        </form>
    </div>

<?php 
echo '<h1>Instant Spells</h1> ';
$path = 'Z:\D\aeia_git\AeiaOTS\data\spells'; 
if (is_dir($path)) { 
    if ($config['log_ip']) 
    {
        znote_visitor_insert_detailed_data(3);
    }

    
    
    $val = $_POST['selected'];
    $xml1 = simplexml_load_file($path."\data\spells\spells.xml"); 
    echo '<TABLE BORDER> <TR class="yellow"> <TD >Name</TD> <TD>Words</TD> <TD>Level</TD> <TD>Mana</TD> <TD>Soul</TD> <TD>Requires Premium?</TD> <TD>Vocations</TD></TR> ';
    foreach($xml1->instant as $spell) 
    {
        
        
        $soul = ($spell['soul'] ? $spell['soul'] : 0);
        $vocs = array();
        if($spell->vocation)
        {   
            
            foreach($spell->vocation as $voc)
            {
            
                if ($val != 0)
                {
                    if ($val == 1 && ($voc['id'] == '1;5' || $voc['id'] == '5')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 2 && ($voc['id'] == '2;6' || $voc['id'] == '6')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 3 && ($voc['id'] == '3;7' || $voc['id'] == '7')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 4 && ($voc['id'] == '4;8' || $voc['id'] == '8')) 
                        array_push($vocs, $voc['id']);
                    
                }
                else
                    array_push($vocs, $voc['id']);
                    
            }    
            
            
            $vocs = array_concat($vocs, ', ');
            
            
            if (strlen($vocs) == 0)
                continue;
                
        }
        else
            $vocs = "All";
        
        $prem = ($spell['prem'] == 1) ?  "<font color=green><strong>YES</strong></font>" : "<font color=red><strong>NO</strong></font>";
    
        echo '<TR class="special"> <TD>'.$spell['name'].'</TD> <TD>'.$spell['words'].'</TD> <TD>'.$spell['lvl'].'<TD>'.$spell['mana'].'</TD> <TD> '.$soul.'</TD> <TD>'.$prem.' </TD> <TD>'.$vocs.'</TR></TR>';
    
    }
    echo'</TABLE>';


    echo'<h1>Conjure Spells</h1> ';
    echo '<TABLE BORDER> <TR class="yellow"> <TD >Name</TD> <TD>Words</TD> <TD>Level</TD> <TD>Mana</TD> <TD>Soul</TD> <TD>Requires Premium?</TD> <TD>Vocations</TD></TR> ';
    foreach($xml1->conjure as $spell) 
    {
        $soul = ($spell['soul'] ? $spell['soul'] : 0);
        $vocs = array();
    if($spell->vocation)
    {    foreach($spell->vocation as $voc)
        {
            if ($val != 0)
                {
                    if ($val == 1 && ($voc['id'] == '1;5' || $voc['id'] == '5')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 2 && ($voc['id'] == '2;6' || $voc['id'] == '6')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 3 && ($voc['id'] == '3;7' || $voc['id'] == '7')) 
                        array_push($vocs, $voc['id']);
                    elseif ($val == 4 && ($voc['id'] == '4;8' || $voc['id'] == '8')) 
                        array_push($vocs, $voc['id']);
                    
                }
                else
                    array_push($vocs, $voc['id']);
        }        
        $vocs = array_concat($vocs, ', ');
        if (strlen($vocs) == 0)
                continue;
    }
    else
        $vocs = "All";
        $prem = ($spell['prem'] == 1) ?  "<font color=green><strong>YES</strong></font>" : "<font color=red><strong>NO</strong></font>";
        
    echo '<TR class="special"> <TD>'.$spell['name'].'</TD> <TD>'.$spell['words'].'</TD> <TD>'.$spell['lvl'].'<TD>'.$spell['mana'].'</TD> <TD> '.$soul.'</TD> <TD>'.$prem.' </TD> <TD>'.$vocs.'</TR> </TR>';
    
    }
    echo'</TABLE>';

}
else
{
    echo '<br><b>Invalid path!</b>'; 
     
} 
?> 

<?php include 'layout/overall/footer.php'; ?>