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
@RequestMapping("/PageAddTranslation")
class AddTranslationController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "AddTranslation";
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
