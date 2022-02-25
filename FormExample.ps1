Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Check User Availability'
$form.Size = New-Object System.Drawing.Size(320,250)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(30,145)
$okButton.Size = New-Object System.Drawing.Size(120,23)
$okButton.Text = 'Check Availability'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::Retry
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(180,145)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$firstNameLbl = New-Object System.Windows.Forms.Label
$firstNameLbl.Location = New-Object System.Drawing.Point(20,25)
$firstNameLbl.Size = New-Object System.Drawing.Size(280,20)
$firstNameLbl.Text = 'First Name'
$form.Controls.Add($firstNameLbl)

$firstNameTxtBx = New-Object System.Windows.Forms.TextBox
$firstNameTxtBx.Location = New-Object System.Drawing.Point(20,40)
$firstNameTxtBx.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($firstNameTxtBx)

$lastNameLbl = New-Object System.Windows.Forms.Label
$lastNameLbl.Location = New-Object System.Drawing.Point(20,65)
$lastNameLbl.Size = New-Object System.Drawing.Size(280,20)
$lastNameLbl.Text = 'Last Name'
$form.Controls.Add($lastNameLbl)

$lastNameTxtBx = New-Object System.Windows.Forms.TextBox
$lastNameTxtBx.Location = New-Object System.Drawing.Point(20,80)
$lastNameTxtBx.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($lastNameTxtBx)

$emailLbl = New-Object System.Windows.Forms.Label
$emailLbl.Location = New-Object System.Drawing.Point(20,105)
$emailLbl.Size = New-Object System.Drawing.Size(280,20)
$emailLbl.Text = 'Email'
$form.Controls.Add($emailLbl)

$emailTxtBx = New-Object System.Windows.Forms.TextBox
$emailTxtBx.Location = New-Object System.Drawing.Point(20,120)
$emailTxtBx.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($emailTxtBx)

$resultLbl = New-Object System.Windows.Forms.Label
$resultLbl.Location = New-Object System.Drawing.Point(100,180)
$resultLbl.Size = New-Object System.Drawing.Size(280,20)
$resultLbl.Text = 'Result:'
$form.Controls.Add($resultLbl)

$form.Topmost = $true

$form.Add_Shown({$firstNameTxtBx.Select()})
$result = $form.ShowDialog()

While ($result -ne [System.Windows.Forms.DialogResult]::Cancel) {
    If ($emailTxtBx.Text.Length -gt 20) {
        $resultString = "Unavailable"
        $resultLbl.Text = "Result: $resultString"
        $form.Topmost = $true
        $form.Add_Shown({$firstNameTxtBx.Select()})
        $result = $form.ShowDialog()
    } Else {
        $resultString = "Available"
        $resultLbl.Text = "Result: $resultString"
        $form.Topmost = $true
        $form.Add_Shown({$firstNameTxtBx.Select()})
        $result = $form.ShowDialog()
    }
}
