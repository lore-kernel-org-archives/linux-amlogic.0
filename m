Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E5DCD4F26
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:References:
	Date:Subject:Mime-Version:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTG2Kt7RJCzTwvRa24c9k+Acfn0i9R5qREpM7aQMFUg=; b=wipwmEV1vsp9Ge
	Sl1uqhYhrFRWv4TFLtbu2z0AJmjrDj3iF26BsajXWIlB+RG41K6VEPHcJHsyqxVxrG+ZChA5f4mSC
	um9A85lLlW2D4K4qPgF0fWDY0v74bZiwRBxbNF8Ay4M4KFF0BtbpmdV8Zc0pWf0Ww/R5QSquDNKVX
	zyT0Zxb+3wvmwGp4GXgOJw1KXf2WmcfMelKoJdYoE9WUhmpqsFDw43HcJO4ZhRLYZfWtJEho5zBjW
	nGb5tAf0iBzbjuRjTQO3hvRaN49Mgiq60+e4QFNqatbcgrOzD0v4JnnoiBv5S4IzmmEMz3agfVDzl
	ULkddcDOF0yAMifbQ0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1dD-0000000AlMg-1lhL;
	Fri, 26 Jun 2026 08:09:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1dA-0000000AlLN-3RUw
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 08:09:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5ad578c49afso623295e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461382; x=1783066182; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=WWrZKhm9g9rsApTee0/C8NTNchd0cYhemvWe3m3Kvj/I4mqKqU4qzHhRpK5A8/ayP8
         NO/RKDb+1k2ooC4qxJl0ikgEIERs6qdCmb6LC6XsnHbsortkhOFxRUoP68gHE0mpGKWj
         vSJKQgfRmgG9ptNJ8J7evjtKg1k9YJnmkVsi9ISeE2cJxteMo5KQnwDcbSyfcPhxEAVJ
         87z91qfSc3GU4VBVqQPeWrpSeOpObf7X7SUKR4rZpqnJe4DJ+Q5u+cQkQeqN6ijP43i4
         0j4E3jUejTjo2G1YYjj7Cs8zZQVPfmG+aH4l4axRytzLf5SRe3+CQ6Epw/+lekDovlBL
         TnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461382; x=1783066182;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=EBMvhwOZZteIwU5Ld0Fvx+QJEfHpg/JtWPDClLZMmn1FHks+wMe/z5VKYadEKp4zac
         FxZ7KuYtLXPHaZzPnihPj5I2AhwzI4RJAZJ1lwvUW58qzHQDgmH85sxXN/VxZz9VTgUp
         nxiYK6Qx0lGYDuFHza04gKoLVusTkmvuq/AEdLaaEu0vB6Ha1137FHoOJXEqyFIDC/bV
         uQBliMjTIgGXuFvxutMA858RuC74yvyIEnYHGgodoCNlDsJ87t//MRZvIF7Sh0BnAI99
         CfkV8xMSw6rVYuhvHrFzr1Uvq+rB69vLwL+IG9y7pB20sVKxstoEIgw1WX1dsc0Mv7D2
         aN4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqxhfa/S/sQzZOwwVfTtE6m88X5G5UgQqbqFUluE/YfJnjD3H7N+XqQPgi9b5cDB8L3m8IqxLHC06P+BBNJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5dbO33AbzeovTB8mKPNbRrWQpImUli8rHQnURQkGl1ZWkoPjw
	B13ZaPBp255taYGur9lwlRWTagr4K4I1BYZrjEaOlCJ/+HdlnF17MXf/
X-Gm-Gg: AfdE7clCBXnTuM2tb82m3Jjidegrgs6J9Lxklv6x/E/KLRMBFWdkr1WJ2QPerNqAWwe
	QuwrxPidtGXr1rSV4Q31OHYMQZ+0oAJcnb6QDpfwzbiuO5wdFw1NGZotR1NNNLbKLDmuO+RMSsW
	f8cL3dEeCrqorfHJyb4BWlM1i5zSjqzNYAbDdhalpvHP3KWJF9ibBcI7hUesAeFe57+vHOz60Go
	xAorXWUsL43XpxCSWHSpKyMpeyADgHTWFrdGK/gvXToOEPijMcDTNZDPvmpfCosAkMHgW+f6gar
	Hwr945d9R9DduC2G4uKXB8f6KVpRMd1N7aofAkO9xSmT0PAIbzQ8bWD+Fto6d+FJs/ivZYE9R+X
	FUL5KHbtl6hNH1x0kTihnp4YjpKkv8ZTqEjbWioYaKHLKxB8LGNhi/LizCOSzgHhK+OBysVdul3
	+cR6rXALPUUyQy0SzGsBzHXHJjyUY3G42oprFA8mLGOg==
X-Received: by 2002:a05:6512:3087:b0:5ad:5daa:9c90 with SMTP id 2adb3069b0e04-5aea1f579b6mr2196508e87.52.1782461382239;
        Fri, 26 Jun 2026 01:09:42 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea80d4722sm186240e87.26.2026.06.26.01.09.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:09:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
Date: Fri, 26 Jun 2026 12:09:26 +0400
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
Message-Id: <82AA2E33-70B4-4EEC-882A-EABDB51904FA@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_010944_888138_AF073990 
X-CRM114-Status: GOOD (  16.63  )
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

PiBPbiAyNiBKdW4gMjAyNiwgYXQgMTI6MDTigK9wbSwgQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0
aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+IFRoZSBJMlMgRklGTyBzb2Z0LXJlc2V0
cyBpdHMgZmFzdCBkb21haW4gb24gc3RhcnQgKEFJVV9SU1RfU09GVCBiaXQgMCArCj4gQUlVX0ky
U19TWU5DIHJlYWQgaW4gYWl1X2ZpZm9faTJzX3RyaWdnZXIpLCBtaXJyb3JpbmcgdGhlIGRvd25z
dHJlYW0KPiB2ZW5kb3IgZHJpdmVyJ3MgYXVkaW9fb3V0X2kyc19lbmFibGUoKS4gVGhlIFMvUERJ
RiBGSUZPIGhhcyBubyBlcXVpdmFsZW50Ogo+IGl0IG9ubHkgdG9nZ2xlcyB0aGUgSUVDOTU4IERD
VSwgc28gYSBzdGFsZSBkYXRhcGF0aCBGSUZPIGNhbiBiZSByZXBsYXllZCwKPiBwcm9kdWNpbmcg
dGhlICJtYWNoaW5lIGd1biBub2lzZSIgYnVmZmVyIHVuZGVycnVuIC0gb24gc3RhcnQgd2hlbiBz
d2l0Y2hpbmcKPiBvdXRwdXRzLCBhbmQgb24gc3RvcCB3aGVuIHBsYXliYWNrIGVuZHMuIFRoZSBs
YXR0ZXIgaXMgYXVkaWJsZSBvbiBkZXZpY2VzCj4gd2l0aCBhbiBhbHdheXMtb24gUy9QRElGLWZl
ZCBEQUMgKGUuZy4gdGhlIEVTNzE0NCBvbiB0aGUgV2VUZWsgUGxheTIpLgo+IAo+IFRoZSB2ZW5k
b3IgZHJpdmVyIHJlc2V0cyB0aGUgSUVDOTU4IGZhc3QgZG9tYWluIChBSVVfUlNUX1NPRlQgYml0
IDIpIG9uCj4gYm90aCBlbmFibGUgYW5kIGRpc2FibGUgKGF1ZGlvX2h3Xzk1OF9lbmFibGUpLCBh
bmQgd2hlbiByZWNvbmZpZ3VyaW5nCj4gKGF1ZGlvX2h3Xzk1OF9yZXNldCBjbGVhcnMgQUlVXzk1
OF9EQ1VfRkZfQ1RSTCB0aGVuIHJlc2V0cykuIERvIHRoZSBzYW1lOgo+IHJlc2V0IGJlZm9yZSBl
bmFibGluZyB0aGUgRENVIG9uIHN0YXJ0LCBhbmQgYWZ0ZXIgZGlzYWJsaW5nIGl0IG9uIHN0b3Au
CgpGaXhlczogNmFlOWNhOWNlOTg2YmYgKCJBU29DOiBtZXNvbjogYWl1OiBhZGQgaTJzIGFuZCBz
cGRpZiBzdXBwb3J04oCdKQoKXiBJIGNhbiBzZW5kIGEgdjIgd2l0aCBpdCBkb25lIHByb3Blcmx5
IGlmIG5lZWRlZD8KCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFu
c2hld2l0dEBnbWFpbC5jb20+Cj4gLS0tCj4gc291bmQvc29jL21lc29uL2FpdS1maWZvLXNwZGlm
LmMgfCA1ICsrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYWl1LWZpZm8tc3BkaWYuYyBiL3NvdW5kL3NvYy9tZXNv
bi9haXUtZmlmby1zcGRpZi5jCj4gaW5kZXggZTBlMDBlYzAyNmRjLi44MjYwNTVhNzE0MjEgMTAw
NjQ0Cj4gLS0tIGEvc291bmQvc29jL21lc29uL2FpdS1maWZvLXNwZGlmLmMKPiArKysgYi9zb3Vu
ZC9zb2MvbWVzb24vYWl1LWZpZm8tc3BkaWYuYwo+IEBAIC0yNCw2ICsyNCw3IEBACj4gI2RlZmlu
ZSBBSVVfTUVNX0lFQzk1OF9DT05UUk9MX01PREVfMTZCSVQgQklUKDcpCj4gI2RlZmluZSBBSVVf
TUVNX0lFQzk1OF9DT05UUk9MX01PREVfTElORUFSIEJJVCg4KQo+ICNkZWZpbmUgQUlVX01FTV9J
RUM5NThfQlVGX0NOVExfSU5JVCBCSVQoMCkKPiArI2RlZmluZSBBSVVfUlNUX1NPRlRfOTU4X0ZB
U1QgQklUKDIpCj4gCj4gI2RlZmluZSBBSVVfRklGT19TUERJRl9CTE9DSyA4Cj4gCj4gQEAgLTY4
LDEyICs2OSwxNiBAQCBzdGF0aWMgaW50IGZpZm9fc3BkaWZfdHJpZ2dlcihzdHJ1Y3Qgc25kX3Bj
bV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwgaW50IGNtZCwKPiBjYXNlIFNORFJWX1BDTV9UUklHR0VS
X1NUQVJUOgo+IGNhc2UgU05EUlZfUENNX1RSSUdHRVJfUkVTVU1FOgo+IGNhc2UgU05EUlZfUENN
X1RSSUdHRVJfUEFVU0VfUkVMRUFTRToKPiArIHNuZF9zb2NfY29tcG9uZW50X3dyaXRlKGNvbXBv
bmVudCwgQUlVX1JTVF9TT0ZULAo+ICsgQUlVX1JTVF9TT0ZUXzk1OF9GQVNUKTsKPiBmaWZvX3Nw
ZGlmX2RjdV9lbmFibGUoY29tcG9uZW50LCB0cnVlKTsKPiBicmVhazsKPiBjYXNlIFNORFJWX1BD
TV9UUklHR0VSX1NVU1BFTkQ6Cj4gY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9QVVNIOgo+
IGNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RPUDoKPiBmaWZvX3NwZGlmX2RjdV9lbmFibGUoY29t
cG9uZW50LCBmYWxzZSk7Cj4gKyBzbmRfc29jX2NvbXBvbmVudF93cml0ZShjb21wb25lbnQsIEFJ
VV9SU1RfU09GVCwKPiArIEFJVV9SU1RfU09GVF85NThfRkFTVCk7Cj4gYnJlYWs7Cj4gZGVmYXVs
dDoKPiByZXR1cm4gLUVJTlZBTDsKPiAtLSAKPiAyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
