#!/usr/bin/env node

with (require('karabinerge')) {

let apps = {
	login: 'com.apple.loginwindow',
	atom: 'com.github.atom',
	vscode: 'com.microsoft.VSCode',
	vscodium: 'com.vscodium',
	eclipse: 'org.eclipse.platform.ide',
	sonicpi: 'net.sonic-pi.app'
};

let rules = new RuleSet('Mighty Thumb');

rules.add('Use 英数 as an extra modifier key (Required)')
	.remap({
		from: key('japanese_eisuu', { optional: 'any' }),
		to:   set_var('mightythumb_l', 1, { lazy: true }),
		to_after_key_up: set_var('mightythumb_l', 0),
		to_if_alone:     key('japanese_eisuu')
	});

rules.add('Use かな as ALT modifier key')
	.remap({
		from: key('japanese_kana', { optional: 'any' }),
		to:   key('left_option', null, { lazy: true }),
		to_if_alone: key('japanese_kana')
	});


let left_thumb = if_var('mightythumb_l', 1);

rules.add('英数 + E / D / S / F = Up / Down / Left / Right')
	.cond(left_thumb)
	.remap({
		from: key('e', { optional: 'any' }),
		to:   key('up_arrow')
	})
	.remap({
		from: key('d', { optional: 'any' }),
		to:   key('down_arrow')
	})
	.remap({
		from: key('s', { optional: 'any' }),
		to:   key('left_arrow')
	})
	.remap({
		from: key('f', { optional: 'any' }),
		to:   key('right_arrow')
	});

rules.add('英数 + W / R = Page Up / Down')
	.cond(left_thumb)
	.remap({
		from: key('w'),
		to:   key('page_up')
	})
	.remap({
		from: key('r'),
		to:   key('page_down')
	});

rules.add('英数 + A / G = Previous / Next Word')
	.cond(left_thumb)
	.cond(unless_app(apps.sonicpi))
	.remap({
		from: key('a'),
		to:   key('left_arrow', 'option')
	})
	.remap({
		from: key('g'),
		to:   key('right_arrow', 'option')
	});

rules.add('英数 + A / G = Previous / Next Word (Sonic Pi)')
	.cond(left_thumb)
	.cond(if_app(apps.sonicpi))
	.remap({
		from: key('a'),
		to:   key('b', 'command')
	})
	.remap({
		from: key('g'),
		to:   key('f', 'command')
	});

rules.add('英数 + Q / T = Beginning / End of Line')
	.cond(left_thumb)
	.cond(unless_app(apps.sonicpi))
	.remap({
		from: key('q'),
		to:   key('left_arrow', 'command')
	})
	.remap({
		from: key('t'),
		to:   key('right_arrow', 'command')
	});

rules.add('英数 + Q / T = Beginning / End of Line (Sonic Pi)')
	.cond(left_thumb)
	.cond(if_app(apps.sonicpi))
	.remap({
		from: key('q'),
		to:   key('a', 'control')
	})
	.remap({
		from: key('t'),
		to:   key('e', 'control')
	});

rules.add('英数 + I / K / J / L = Select Text')
	.cond(left_thumb)
	.remap({
		from: key('i'),
		to:   key('up_arrow', 'shift')
	})
	.remap({
		from: key('k'),
		to:   key('down_arrow', 'shift')
	})
	.remap({
		from: key('j'),
		to:   key('left_arrow', 'shift')
	})
	.remap({
		from: key('l'),
		to:   key('right_arrow', 'shift')
	});

rules.add('英数 + U / O = Unindent / Indent')
	.cond(left_thumb)
	.remap({
		from: key('u'),
		to:   key('tab', 'shift')
	})
	.remap({
		from: key('o'),
		to:   key('tab')
	});

rules.add('英数 + H / N = Backward / Forward Delete')
	.cond(left_thumb)
	.remap({
		from: key('h'),
		to:   key('delete_or_backspace')
	})
	.remap({
		from: key('n'),
		to:   key('delete_or_backspace', 'fn')
	});

rules.add('英数 + Z / X / C / V = Undo / Cut / Copy / Paste')
	.cond(left_thumb)
	.remap({
		from: key('z'),
		to:   key('z', 'command')
	})
	.remap({
		from: key('x'),
		to:   key('x', 'command')
	})
	.remap({
		from: key('c'),
		to:   key('c', 'command')
	})
	.remap({
		from: key('v'),
		to:   key('v', 'command')
	});

rules.add('英数 + M = Delete Line (Atom)')
	.cond(left_thumb)
	.cond(if_app(apps.atom))
	.remap({
		from: key('m'),
		to:   key('k', ['control', 'shift'])
	});

rules.add('英数 + M = Delete Line (VSCode)')
	.cond(left_thumb)
	.cond(if_app(apps.vscode, apps.vscodium))
	.remap({
		from: key('m'),
		to:   key('k', ['command', 'shift'])
	});

rules.add('英数 + M = Delete Line (Eclipse)')
	.cond(left_thumb)
	.cond(if_app(apps.eclipse))
	.remap({
		from: key('m'),
		to:   key('d', 'command')
	});

rules.add('英数 + Enter = New Line Below (Atom, VSCode)')
	.cond(left_thumb)
	.cond(if_app(apps.atom, apps.vscode, apps.vscodium))
	.remap({
		from: key('return_or_enter'),
		to:   key('return_or_enter', 'command')
	});

rules.add('英数 + Enter = New Line Below (Eclipse)')
	.cond(left_thumb)
	.cond(if_app(apps.eclipse))
	.remap({
		from: key('return_or_enter'),
		to:   key('return_or_enter', 'shift')
	});

rules.add('英数 + , / . = Move Line Up / Down (Atom)')
	.cond(left_thumb)
	.cond(if_app(apps.atom))
	.remap({
		from: key('comma'),
		to:   key('up_arrow', ['command', 'control'])
	})
	.remap({
		from: key('period'),
		to:   key('down_arrow', ['command', 'control'])
	});

rules.add('英数 + , / . = Move Line Up / Down (VSCode, Eclipse)')
	.cond(left_thumb)
	.cond(if_app(apps.vscode, apps.vscodium, apps.eclipse))
	.remap({
		from: key('comma'),
		to:   key('up_arrow', 'option')
	})
	.remap({
		from: key('period'),
		to:   key('down_arrow', 'option')
	});

rules.add('英数 + , / . = Move Line Up / Down (Sonic Pi)')
	.cond(left_thumb)
	.cond(if_app(apps.sonicpi))
	.remap({
		from: key('comma'),
		to:   key('p', ['command', 'control'])
	})
	.remap({
		from: key('period'),
		to:   key('n', ['command', 'control'])
	});

rules.add('英数 + 2 / 3 = Previous / Next Tab')
	.cond(left_thumb)
	.cond(unless_app(apps.vscode, apps.vscodium, apps.eclipse))
	.remap({
		from: key('2'),
		to:   key('tab', ['control', 'shift'])
	})
	.remap({
		from: key('3'),
		to:   key('tab', 'control')
	});

rules.add('英数 + 2 / 3 = Previous / Next Tab (VSCode)')
	.cond(left_thumb)
	.cond(if_app(apps.vscode, apps.vscodium))
	.remap({
		from: key('2'),
		to:   key('left_arrow', ['command', 'option'])
	})
	.remap({
		from: key('3'),
		to:   key('right_arrow', ['command', 'option'])
	});

rules.add('英数 + 2 / 3 = Previous / Next Tab (Eclipse)')
	.cond(left_thumb)
	.cond(if_app(apps.eclipse))
	.remap({
		from: key('2'),
		to:   key('page_up', 'control')
	})
	.remap({
		from: key('3'),
		to:   key('page_down', 'control')
	});

rules.add('英数 + 1 / 4 = Close / New Tab')
	.cond(left_thumb)
	.remap({
		from: key('1'),
		to:   key('w', 'command')
	})
	.remap({
		from: key('4'),
		to:   key('t', 'command')
	});

rules.add('英数 + Tab = Enter')
	.cond(left_thumb)
	.remap({
		from: key('tab'),
		to:   key('return_or_enter')
	});

rules.add('英数 + /(Slash) = \\(Backslash)')
	.cond(left_thumb)
	.remap({
		from: key('slash'),
		to:   key('international3', 'left_option')
	});

rules.add('英数 + Control + Q / W = Browser Back / Forward')
	.cond(left_thumb)
	.remap({
		from: key('q', 'control'),
		to:   key('left_arrow', 'command')
	})
	.remap({
		from: key('w', 'control'),
		to:   key('right_arrow', 'command')
	});

rules.add('英数 + Control = Numpad Mode (Space=0 NM,=123 JKL=456 UIO=789)')
	.cond(left_thumb)
	.remap({
		from: key('spacebar', 'control'),
		to:   key('keypad_0')
	})
	.remap({
		from: key('n', 'control'),
		to:   key('keypad_1')
	})
	.remap({
		from: key('m', 'control'),
		to:   key('keypad_2')
	})
	.remap({
		from: key('comma', 'control'),
		to:   key('keypad_3')
	})
	.remap({
		from: key('period', 'control'),
		to:   key('keypad_period')
	})
	.remap({
		from: key('j', 'control'),
		to:   key('keypad_4')
	})
	.remap({
		from: key('k', 'control'),
		to:   key('keypad_5')
	})
	.remap({
		from: key('l', 'control'),
		to:   key('keypad_6')
	})
	.remap({
		from: key('u', 'control'),
		to:   key('keypad_7')
	})
	.remap({
		from: key('i', 'control'),
		to:   key('keypad_8')
	})
	.remap({
		from: key('o', 'control'),
		to:   key('keypad_9')
	})
	.remap({
		from: key('semicolon', 'control'),
		to:   key('keypad_plus')
	})
	.remap({
		from: key('p', 'control'),
		to:   key('keypad_hyphen')
	})
	.remap({
		from: key('9', 'control'),
		to:   key('keypad_asterisk')
	})
	.remap({
		from: key('8', 'control'),
		to:   key('keypad_slash')
	});

rules.add('[EXTRA] Shift + Space = Underscore')
	.cond(if_lang('en'))
	.remap({
		from: key('spacebar', 'shift'),
		to:   key('international1')
	});


// ---- touchpad specific features -------- *
let touched = unless_var('multitouch_extension_finger_count_total', 0);

rules.add('Touchpad + J = Left Click (Multitouch-Extension required)')
	.cond(touched)
	.cond(unless_app(apps.login))
	.remap({
		from: key('j', { optional: 'any' }),
		to:   click('left')
	});

rules.add('Touchpad + K = Right Click (Multitouch-Extension required)')
	.cond(touched)
	.cond(unless_app(apps.login))
	.remap({
		from: key('k', { optional: 'any' }),
		to:   click('right')
	});

rules.add('Touchpad + L = Middle Click (Multitouch-Extension required)')
	.cond(touched)
	.cond(unless_app(apps.login))
	.remap({
		from: key('l', { optional: 'any' }),
		to:   click('middle')
	});

rules.add('Touchpad + U / O = Previous / Next Tab (Multitouch-Extension required)')
	.cond(touched)
	.cond(unless_app(apps.login, apps.vscode, apps.vscodium, apps.eclipse))
	.remap({
		from: key('u', { optional: 'any' }),
		to:   key('tab', ['control', 'shift'])
	})
	.remap({
		from: key('o', { optional: 'any' }),
		to:   key('tab', 'control')
	});

rules.add('Touchpad + U / O = Previous / Next Tab (VSCode) (Multitouch-Extension required)')
	.cond(touched)
	.cond(if_app(apps.vscode, apps.vscodium))
	.remap({
		from: key('u', { optional: 'any' }),
		to:   key('left_arrow', ['command', 'option'])
	})
	.remap({
		from: key('o', { optional: 'any' }),
		to:   key('right_arrow', ['command', 'option'])
	});

rules.add('Touchpad + U / O = Previous / Next Tab (Eclipse) (Multitouch-Extension required)')
	.cond(touched)
	.cond(if_app(apps.eclipse))
	.remap({
		from: key('u', { optional: 'any' }),
		to:   key('page_up', 'control')
	})
	.remap({
		from: key('o', { optional: 'any' }),
		to:   key('page_down', 'control')
	});

rules.add('Touchpad + M / I = Close / New Tab (Multitouch-Extension required)')
	.cond(touched)
	.cond(unless_app(apps.login))
	.remap({
		from: key('m', { optional: 'any' }),
		to:   key('w', 'command')
	})
	.remap({
		from: key('i', { optional: 'any' }),
		to:   key('t', 'command')
	});

// ---- done. -------- *
rules.out();

}
