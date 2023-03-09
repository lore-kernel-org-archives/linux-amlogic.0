Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C5C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQaxl2quPAiBjhAjxlKwAKr+nptfoOU8wex/Z+gjgN4=; b=v6WAnHB5MTsi/y
	T4xzegPJDFLprJAaxLWLffHCST4rmYRXj9OYjh9eCfPI6/UfOQw8EBQjke+P5KEw4rfs6dS2Y/Ujj
	E6TYVZFpU5ueAgW2dOB+LyOOHe6IgeOP/lnKMI6XGowkNRMFMjSRmHvNVoEqksLvOeAqRbHHJAxm1
	pCoQIHpnkyV0qOJf0IsdKDv0RZUuwpr8ZoH+OVMLp7LvV0sVHekVgkLc8Q76vbB/0na/epwHjlzvO
	+INl4UHn9E9zwhMP4Q/4SS1yC+2YsgGTuoHUtFiNEpbM7wSzG+Ij9j0UzhTId7GaTthjcELlaqLmD
	7H26dFGb7ZXvZO451tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO0z-00C31s-W6; Thu, 09 Mar 2023 21:41:34 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO0w-00C30X-JT; Thu, 09 Mar 2023 21:41:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cw28so12744852edb.5;
        Thu, 09 Mar 2023 13:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678398089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR1b3GABOQLV0P4AFqJgRYAPV/jd6YPCXWJ10JJ7GQA=;
        b=bVV9zB4PWz/GixwLQd9wj07swwOT/5L8l7AYGlJV39XCgfm5cBj2R76j8n/krnPBNF
         e6HICDvbiaQ1x+XAwjDG08vSRQer/+wTj3q6MkzNMSS3saTFHaS1S2G6cRX2Utbv2eTh
         tWb/JB6UcF+rBSP568bMYcbPnQ2dtX4rPGjdmatlyv7z3GqmrqLzsZq1x3SirUPCsaHu
         LnmAjGvKRmkVtoqaSL09XqXrDe58MJ1OEVF6In8g1AEIakrXwIsRWGh7HbBFoPpaCO4W
         c/kYP+I4vqJB6PSZdBea/WNQx9UYjXpcAk2AfzMmwcdOGOGificFynYzuK2ISXl506in
         VU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678398089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR1b3GABOQLV0P4AFqJgRYAPV/jd6YPCXWJ10JJ7GQA=;
        b=qaF0U1Lkx6okDR7ON/oIaifmsRteLfwqxb6oKt0Qxr6wJHc5G+TyuRHh2BeZKl1LUc
         StxBvPWtXEv+U9GRIpy7KkU0FysQ3pn5kxvii0hNPODJbs+33236xyJTv8ogZa4xAYdg
         kVWBXuag4+6kBkHhuKRIg27W7VM5DXVphBXSDdLgE90zFQ711X22rdemq0e/6fRV0z7r
         rGdtFcVTavyRjocroJ7nZ6sMQsz60af4lvkglU/lfUfS2jOxwJmJb1s/kw3OXt6wFn5J
         60fSpuF7NTD9LNLBukCf2FmB/OVmwgSaw7aMbWNipsPBW6RP4aiR5yWp1AVIBjmvbOhC
         qq5g==
X-Gm-Message-State: AO0yUKUtlbW13z0Z+RNq/msBFQu182NCV0FUI+M/O3sN9EWZVZ+m3VHy
	ZPPcwHpCvENVxAaTPgp0QlO83Af16MgEC/ZQDVc=
X-Google-Smtp-Source: AK7set+iplnwVXlr7+v6coCIsyOhlACFhoeoFarKEw4JA1Y6NwVDADLB4DScaPTQyE9qNP613oIHrbUsSOajkyzvD+I=
X-Received: by 2002:a17:906:ce38:b0:8b1:30da:b585 with SMTP id
 sd24-20020a170906ce3800b008b130dab585mr12117490ejb.6.1678398088913; Thu, 09
 Mar 2023 13:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20230306103533.4915-1-johan+linaro@kernel.org>
In-Reply-To: <20230306103533.4915-1-johan+linaro@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Mar 2023 22:41:18 +0100
Message-ID: <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
To: Johan Hovold <johan+linaro@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_134130_659362_F2A958BF 
X-CRM114-Status: UNSURE (   7.97  )
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

SGkgSm9oYW4sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBNb24sIE1hciA2LCAyMDIzIGF0
IDExOjM14oCvQU0gSm9oYW4gSG92b2xkIDxqb2hhbitsaW5hcm9Aa2VybmVsLm9yZz4gd3JvdGU6
ClsuLi5dCj4gQEAgLTMyNSwyMyArMzI1LDIzIEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRf
bWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykKPgo+ICAgICAg
ICAgcmV0ID0gbWVzb25fZW5jb2Rlcl9oZG1pX2luaXQocHJpdik7CkknbSB3b25kZXJpbmcgaWYg
Y29tcG9uZW50X2JpbmRfYWxsKCkgY2FuIGJlIG1vdmVkIGZ1cnRoZXIgZG93bi4KUmlnaHQgbm93
IGl0J3MgYmV0d2VlbiBtZXNvbl9lbmNvZGVyX2N2YnNfaW5pdCgpIGFuZAptZXNvbl9lbmNvZGVy
X2hkbWlfaW5pdCgpLiBTbyBpdCBzZWVtcyB0aGF0IGVuY29kZXJzIGRvbid0IHJlbHkgb24KY29t
cG9uZW50IHJlZ2lzdHJhdGlvbi4KClVuZm9ydHVuYXRlbHkgSSBhbSBhbHNvIG5vdCBmYW1pbGlh
ciB3aXRoIHRoaXMgYW5kIEknbSBob3BpbmcgdGhhdApOZWlsIGNhbiBjb21tZW50IG9uIHRoaXMu
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
