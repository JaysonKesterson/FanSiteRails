
[1mFrom:[0m /mnt/c/Users/autum/FanSiteRails/app/controllers/sessions_controller.rb:18 SessionsController#create:

     [1;34m7[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m8[0m:   [32mif[0m params[[33m:fan[0m]
     [1;34m9[0m:       @fan = [1;34;4mFan[0m.find_by([35musername[0m: params[[33m:fan[0m][[33m:username[0m])
    [1;34m10[0m:       [32mif[0m @fan && @fan.authenticate(params[[33m:fan[0m][[33m:password[0m])
    [1;34m11[0m:           session[[33m:fan_id[0m] = @fan.id 
    [1;34m12[0m:           redirect_to fan_path(@fan)
    [1;34m13[0m:       [32melse[0m
    [1;34m14[0m:           redirect_to signin_path
    [1;34m15[0m:       [32mend[0m
    [1;34m16[0m:   [32melse[0m
    [1;34m17[0m:       [32mif[0m @fan = [1;34;4mFan[0m.find_by([35memail[0m: auth[[31m[1;31m'[0m[31memail[1;31m'[0m[31m[0m])
 => [1;34m18[0m:           binding.pry 
    [1;34m19[0m:           session[[33m:fan_id[0m] = @fan.id
    [1;34m20[0m:           redirect_to fan_path(@fan)
    [1;34m21[0m:       [32melse[0m
    [1;34m22[0m:           @fan = [1;34;4mFan[0m.new([35memail[0m: auth[[31m[1;31m'[0m[31memail[1;31m'[0m[31m[0m], [35musername[0m: auth[[31m[1;31m'[0m[31musername[1;31m'[0m[31m[0m], [35mpassword[0m: [1;34;4mSecureRandom[0m.hex)
    [1;34m23[0m:             [32mif[0m @fan.save
    [1;34m24[0m:               session[[33m:fan_id[0m] = @fan.id
    [1;34m25[0m:               redirect_to fan_path(@fan)
    [1;34m26[0m:             [32melse[0m
    [1;34m27[0m:               render [33m:new[0m
    [1;34m28[0m:             [32mend[0m
    [1;34m29[0m:       [32mend[0m
    [1;34m30[0m:   [32mend[0m
    [1;34m31[0m: [32mend[0m

