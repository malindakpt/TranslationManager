package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class PageController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
        return "Index";
	}
}

@Controller
@RequestMapping("/index")
class IndexGETController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "Index";
	}
}

@Controller
@RequestMapping("/index")
class IndexController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "Index";
	}
}

@Controller
@RequestMapping("/PageAddTranslation")
class AddTranslationController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "AddTranslation";
	}
}

@Controller
@RequestMapping("/PageAllTranslations")
class PageAllTranslationsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/allTranslationsTable";
	}
}

@Controller
@RequestMapping("/PageKeySelector")
class PageKeySelectorController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/keySelector";
	}
}

@Controller
@RequestMapping("/PageAddUser")
class PageAddUserController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "AddUser";
	}
}

@Controller
@RequestMapping("/PageAddLanguage")
class AddLanguageController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "AddLanguage";
	}
}

@Controller
@RequestMapping("/PageEditProduct")
class EditProductController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "EditProduct";
	}
}

@Controller
@RequestMapping("/PageLogin")
class PageLoginController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "login";
	}
}

@Controller
@RequestMapping("/PageEditTranslation")
class PageEditTranslationController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "EditTranslation";
	}
}


@Controller
@RequestMapping("/PageProTransTable")
class PageProTransTableController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/productTranslationsTable";
	}
}
