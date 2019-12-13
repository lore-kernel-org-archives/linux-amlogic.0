Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D2C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9401214D8
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TvoXCucI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="RDZC2Ziu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9401214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUn+26r9xgHEhXRTxOa+EJy5xohpPkxuwozL/olwMxE=; b=TvoXCucIq1jFTA
	DNsbmAOrHH51S+Gg+AWiKFdFoegnkTXwZ/jCLOyUnr+Ut63/m4Y/TblfcdDieUY1J7/Sbh+LmJlQu
	/uInMClyEAwY9/q7VxRHIEC7S94QOSMjF3sWL0x5W3q3B7HV189tJEdRVk7zgibiy8vPyx4xEa1My
	v+J8KWcX4YlW7MxINvVlHPfwl8P7JhsmnbPw4cPxUJJZBcRyIGY4X/y8e6l2ThADQiY3atgSgHSk1
	1KiTKKuANNDiwVPK5PcuYz1mYiodjusXrlBXRk5Ct3uQT2krcUoO5o2V7ptN0Od3q4B4LpvK8gSYt
	ysV2F6MT1zozYYzBLadA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifo11-0005NU-Pq; Fri, 13 Dec 2019 16:42:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifo0x-0005MP-DD
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 16:42:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so129838wro.2
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2019 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=RDZC2ZiusGEyrtg6BPZpt/3zIXUDvTioxjK9hCuEm49HHbr3H/dAOfWKhTeLkK3Bp5
 mwslCzN5062kRXM1mLfDGyALHEWNTkHjICeOQc11+9KBDd7f19DKdFfeznFmkiP2iu/b
 X4xf0Xn0uq1+4PP0nKj0gPeSALXRk8hr+7z6OQI2nr4636450ZFHJs8VP3HyfFaJsTVP
 HzWknwSfbUCuDOtglpkghgYl1PzBXP2sQbaCvGZ+HwEkO2egA9fVrLSahpKuX/LZCycb
 kC6vC6YhGlL6xoAsu0f2oh+y3zZZpvkht74vL/pO8ENbamlFgdAMQPwCftTj41QI1w5d
 MyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=o3cWn42OPdX0UaP7aARaeDT7O9hwdIcciHUG0mpvHBXBFq15RTHYLgu87gXdwER/zU
 YhffCMksIMNuMVxVdKsVPbnuvxTWAYd7/O1M1gjASxurEy5fJt8QgOddkBBXEt4uPv0P
 MC6a1Aw2wX28kVKd/KDijzWlC4xvXHFmySGSGbmSIVCLRq+T9E4AX9a5m3t/viWrfL5h
 DEIztrWoJhPYFTlMGCJdFYCUBG+qTrAc4xQkLP5QNUENFyE2pC4h+FbqlJmN8kuA4eTK
 6ZNDIxTqzNFfblx6EgvngFXyBsgwiPt/vtlqxQCyxZjJZEXSUQWIIjM6pmO/DZ0g6ELJ
 EAaw==
X-Gm-Message-State: APjAAAX5JJTE3ZB0H5Kior586ljey8ErDzs0/2+QWqlArxDu266sx+Tg
 nW9ILH+cCrL65f6lGIy2it/8uA==
X-Google-Smtp-Source: APXvYqzIaw4yXEvzLQQBJqUcuUQde/4MOljSnSzj5+B7FHPM/cAqWL9ZIzlETdg8BqlmTOhn/Pq8vg==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr13243381wrw.255.1576255321811; 
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id g69sm11707225wmg.13.2019.12.13.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
Subject: Re: [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org
References: <20191213000657.931618-1-dima@arista.com>
 <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <0e642e4e-7349-3d92-3e54-cbfd8d417fea@arista.com>
Date: Fri, 13 Dec 2019 16:41:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_084203_464475_77317761 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Alexander Shiyan <shc_work@mail.ru>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Kees Cook <keescook@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Patrice Chotard <patrice.chotard@st.com>, Tony Prisk <linux@prisktech.co.nz>,
 Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-fsdevel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCk9uIDEyLzEzLzE5IDU6NDcgQU0sIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6Cj4gTGUgMTMvMTIvMjAxOSDDoCAwMTowNSwgRG1pdHJ5IFNhZm9ub3YgYSDDqWNyaXTCoDoK
Wy4uXQo+IAo+IHBvd2VycGMgcGF0Y2h3b3JrIGRpZG4ndCBnZXQgdGhlIGZ1bGwgc2VyaWVzLCBz
ZWUKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xp
c3QvP3Nlcmllcz0xNDgxOTgKClllcywgSSB3YXMgdW5kZXIgaW1wcmVzc2lvbiB0aGF0IGFyY2hp
dGVjdHVyZSBtYWlsLWxpc3RzIHdhbnQgcmVsYXRlZApwYXRjaGVzLiBCdXQgbm93IEkgc2VlIHRo
YXQgZnJvbSB0aGUgcGF0Y2h3b3JrIHBvaW50IG9mIHZpZXcgaXQncyBiZXR0ZXIKdG8gaGF2ZSB0
aGUgd2hvbGUgc2VyaWVzIGluIGluYm94LgoKPiBDYW4ndCBmaW5kIHRoZW0gb24gbGludXgtc2Vy
aWFsIHBhdGNod29yayBlaXRoZXIKPiAoaHR0cHM6Ly9wYXRjaGVzLmxpbmFyby5vcmcvcHJvamVj
dC9saW51eC1zZXJpYWwvbGlzdC8pCgpJJ20gbm90IHN1cmUgLSBtYXliZSB0aGUgZnJlcXVlbmN5
IG9mIGNoZWNraW5nIGlzIGxvdz8KSSBzZWUgYWxsIHBhdGNoZXMgaW4gbGludXgtc2VyaWFsIG1s
OgpodHRwczovL21hcmMuaW5mby8/bD1saW51eC1zZXJpYWwmcj0xJmI9MjAxOTEyJnc9MgoKPiBJ
dCBpcyBpbXBvc3NpYmxlIHRvIHJldmlldy90ZXN0IHBvd2VycGMgYml0cyB3aXRob3V0IHRoZSBm
aXJzdCBwYXRjaGVzCj4gb2YgdGhlIHNlcmllcywgd2hlcmUgY2FuIHRoZSBlbnRpcmUgc2VyaWVz
IGJlIGZvdW5kID8KClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KSSBjYW4gcmVzZW5kIHdp
dGhvdXQgQ2MnaW5nIGFsbCBwZW9wbGUganVzdCB0byBwcGMgbWFpbC1saXN0IGlmIHRoYXQKd29y
a3MgZm9yIHlvdS4gT3IgeW91IGNhbiBjbG9uZSBpdCBkaXJlY3RseSBmcm9tIG15IGdpdGh1YjoK
aHR0cHM6Ly9naXRodWIuY29tLzB4N2Y0NTRjNDYvbGludXgvdHJlZS9zeXNycS1zZXJpYWwtc2Vx
LXYxCgpUaGFua3MsCiAgICAgICAgICBEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
