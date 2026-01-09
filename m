Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9421D26D99
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUE/WXCKQjcEbPgz8nLxFfuzdecPiJCgvH5IWtvP/X8=; b=OO2kxrZyPkTqyQ
	T6g3p0WCtorMYcqnqMS3WVtwcPjcwH89jPZnguvPB6e2j1gfuQ83NyFrempmedCViQe8iE4QoE794
	qKzpe6pl+MDS2FXHSxLaWbCq0jqaIXvQQdQv74kt5CLcoHCtfH1p+13ab5nyOJX+dKZYSyhW8S6FZ
	nJC0o+S4HOwmWFfa3zqn9uTBbnHIUV8dH/Ul4AfkF1vIHc0NDlogqJ+afEnKbn+rTYfdbss47RyGW
	pvzIfuI6eQku+Fs3S0VQfoTJ2T8iZeWlSbtvbzIBIyDVJ27AoEBDcZWwDOlHIxLZ2sI9LKuw6pMUO
	HRwJdSCPFbh03ZrC/9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJe4-000000031fY-3Z8d;
	Fri, 09 Jan 2026 21:03:44 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJe1-000000031eh-1aJ1
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 21:03:43 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso1856128a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 13:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767992620; x=1768597420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHsh6MGOwaIqqm+hN1oX7sSQ0wIT7SPKXS2wr/sjS7A=;
        b=ZDNZQ2HXGfBCZ/az6FTsFnSEI2YO3fLmc4/Mg6FU92bJT1WriQlWh1EHWnaNl2ucQL
         tvl4rpo70BP4sh6ChMT3U/oeKV4etYgwviZ54Q6ca0/bOOP2W5wZT7AK3/My/8ePCjvf
         ifSI8VZ3126KpMiS4YE9B5fV/o/YdVpc8PVFDoDuv/pTMYx4yI0YzDHDjJ4XCDGtMXfc
         7HHK1B037kgxJZNkZfNzhmAhYUyVKwTcTSKosXmISrulH/eResAop3iJApJcX9xWzzdE
         Waio6HssN+QoxdNeqJ+vxpHzYLs04Rxb/ukH0nvdj5tcqVI508316NbStWBg9cM/nFkC
         hO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992620; x=1768597420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHsh6MGOwaIqqm+hN1oX7sSQ0wIT7SPKXS2wr/sjS7A=;
        b=l4HK7aV4/hR5RUa3adIvuq5UQftUWgtRcqm/G65H800YltMaINMcsTOWi0eyGawBJC
         UPjg/THx0OLNuajJDdN4Rpo52c9CS2KgFEQSOeqgVtrnomBjCfakDPtefe82N6flriTS
         7kN1v8hKUVdvoQ7vSQit+XU5S8QdbqldSSWxwb0Q7J4uTCA3Pd0+NIZIluqF8obPBC6D
         1H8Mhjj0NRL2U/tfD5mqdv8bZx6IG8kqQY+Drwy96nm8i2y3pk1nXUGNfJ73yZ65272S
         tv8bqAAzJnVW2EOaDkKiwAqbbTNNgFNdhRe1WBkg3i0QWmjd/FnEB2f35gQsvcRpvFmQ
         zXmA==
X-Gm-Message-State: AOJu0YzYjWYAW5IBaIfrSof5mOz7HeoMyvcoaBRg6IRTwKGTNTzG2omY
	yP1oUvKbDjdQ1GHjoMDPGro2Uh+pTuqz2IaWnhnOWqAXZBrVCUvufS+rwnCV4eAJJuxlTZ8U/HU
	gXMlGNXbDLH/27j9U+aV7sdY/WmDEeUk=
X-Gm-Gg: AY/fxX68suAWDTRkr8WAD3EURhDWSUq6VmzvyEKY4GDgImikuxOYqw3h4xUNlayZEhT
	oW06WnLTpCDY7BbEiO5817Jb3FmiOT9kh6nwYHykiGimzSivqSEJLnU41DY+wQYtbFCrU28dMmR
	J++ODlxmmR+Oh+IcHYm+Sf/YBaY6Bq8S7Jg+8LePN2Cs6JoDQCB7K/VF4HP+1ky2/5dPpd+GXET
	+kxCL/i0vq/f2r8bhEz/ZwAQ0JwXxtILzDXx3ITGb5OG/QvbO4unyMpaWiltX4j3ooT3ukUrOqL
	/nxOebuD1vCvtfAvBsHa+XkrEfee
X-Google-Smtp-Source: AGHT+IE6xBMNDdxDFDu45mzdnkNgP8Xo2RHjKHEEi7OxCq3tsQhTwUbilionwt/MAUeqVtxj/vFWwNYWT27IOouoivA=
X-Received: by 2002:a17:903:46cc:b0:295:96bc:868c with SMTP id
 d9443c01a7336-2a3ee41d111mr119743015ad.5.1767992620326; Fri, 09 Jan 2026
 13:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20260106090624.518117-1-martin.blumenstingl@googlemail.com> <890f1ce6-60d2-47d4-8552-940f3abd7c1e@linaro.org>
In-Reply-To: <890f1ce6-60d2-47d4-8552-940f3abd7c1e@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Jan 2026 22:03:28 +0100
X-Gm-Features: AZwV_QhnbrdFb8OdNAcoIBBeUA74zu08xfJnlk97QmF8Ut52hYzn5fWJkesO7g0
Message-ID: <CAFBinCAdDVjvu-ZYMZo4cMzmDZVK7kf84txw1v_hh3b4NLdrpw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: move CPU OPP table and clock
 assignment to SoC.dtsi
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_130341_418636_403AA5AE 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKT24gV2VkLCBKYW4gNywgMjAyNiBhdCA2OjU04oCvUE0gPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+IHdyb3RlOgpbLi4uXQo+IFRyaWVkIHRvIGFwcGx5IGl0IG9uIHY2LjE5LXJj
MSBidXQgaXQgZmFpbHMgdG8gYXBwbHk6Cj4KPiBlcnJvcjogcGF0Y2ggZmFpbGVkOiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi5kdHNpOjU3Cj4gZXJyb3I6IGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLmR0c2k6IHBhdGNoIGRvZXMgbm90IGFwcGx5
ClNvcnJ5LCB0aGF0J3MgbXkgZmF1bHQuIEkgaGFkIGEgdGVtcG9yYXJ5IGNoYW5nZSBhcyBhIHBh
cmVudCB0byB0aGlzIG9uZS4KSSBqdXN0IHNlbnQgb3V0IHYyOiBbMF0KCgpbMF0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDI2MDEwOTIxMDIxNy44Mjg5NjEtMS1tYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tL1QvI3UKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
