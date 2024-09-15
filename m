Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BCC3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfewzkOxwps53LoawV3sA5Jj5bI9erTlkuhgv46YMDc=; b=DUaIUY3LpSgozE
	8Mq6p6istPP8UQQAyhxSA1fQqCApL9U19B35oVJX1t0D+0sF5tb06tpFuAJgKP5SJESwoTnDsonE1
	m5/OswjRk9YM/miem9RJiax1Q9hzfT1+WNUUy2CLIcaUKXmSmrl3fRmePTyG9MNQSkAMPqysU44WU
	uNt3dby+daaM1E7e0BK5VgHh9V1k4Ob047OIA6wLPaOGmIrjLVwgMo9YYB7/HcS8hmpPDrlPQmgQn
	Wi8TkKR47kaYO/ePTkOr/5GIsXwJile0hlBE2mkLEQ4nRtRxnFQ7D/Xtg5x30WmYcUQeLBbwQHI0J
	VGFLpoDfihcN568pttOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spv2K-00000002aFk-0pin;
	Sun, 15 Sep 2024 19:35:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spv2E-00000002aEa-3SuZ
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Sep 2024 19:35:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-206f9b872b2so34525935ad.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Sep 2024 12:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726428950; x=1727033750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=New3rH6yb16RO+F7ZmxoIv5gWT8XEiNExKpmL8xStLI=;
        b=XuNDrBBqERsfjHVYm99unvzok6pyJIc0e4+a1CVBoKtX+lH6/OmGXX0dk/egfQHSqi
         8jQsm6dA487eXRBuTdtQDXPL0xUbsg5Yhv8dCogHZIaEgjuFWyiRQ8e2MOvqQ5nE22me
         gvRrFOZzxfePYek6sz8f0pq0/sdQ3VBcZ8BDwS4D6NZqktITaFhtOFfvyE/hnAEB4QpH
         D7Tc8rhXll1tA9cN++8xxMrP2hqdAbfVW8at1OOt8IQLyqCUsc3BwRhhFNPhqnKj3WMe
         Hr20ML2oPbqlRATD2m6Fo5KiWU8dP0KL6+n+dNyQ1CL6J6BFLRtXXZZA9Ivd538O8KKS
         FDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726428950; x=1727033750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=New3rH6yb16RO+F7ZmxoIv5gWT8XEiNExKpmL8xStLI=;
        b=KM5bQpmu2TBjHx4cMYn5rjWrQKOqYXnSMYX3G2ceSrSzOAEq4mXoGmSJbYCZJeMA+w
         YFnWWqMlqqZQG+oGov0/C1jk3Bi1M3ncdlxwFPIX0l3lV/F1KBiooM0JdhZjqymkcmyz
         gTAl+Kc+ljgmWovR04Ykz6rNVOIGEwofHZXHSM1D6zOIV5WFDvNQj7wIq/kpKcKMHscS
         OTSKWxEhrQQTo4+Un5F+umGre9jpT5vEHrv/guNNoN28XZAPUpf4i4Te71YS9Yf+4npt
         IRlIi9VfS6oFan5GmeUPY94MuDaEAHCkpFgIx/6tuRoY+WUfif06dkBl42zEOgRxUS6m
         MvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCjyOYxL5UU5giOkV/IHwQbCTsrNxwd/sL++Jj5kp1pvyHtnk66BxurMy2H/Lf+/d1ubqI5B/F1IelSTNs@lists.infradead.org
X-Gm-Message-State: AOJu0YyxHbeeFK3+1VdL8QqjLcEolxpO6loLYT8mRVi7bcYuqAM8awPS
	/6z8DIJKoYhrlUlWNgvQ5Cym3w5KQxoo/AEw5b4wMZ4oA6NsHI41UEoneDKInU5ssuZK11sHePI
	flo+vsIwMM3MqjUJ6ST+vUdb/G6U=
X-Google-Smtp-Source: AGHT+IEeEBWXAkvZAos6gb/1nBcqfIooFzWaDaf/vow493N7u4RygEa1Dt72D3/O8Hf0ci8+dAfBbMiVeaB8K6wpuVU=
X-Received: by 2002:a17:902:eb8a:b0:206:ca91:1dda with SMTP id
 d9443c01a7336-2076e39c56bmr163749985ad.17.1726428950005; Sun, 15 Sep 2024
 12:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com> <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:35:39 +0200
Message-ID: <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits()
 with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_123550_885159_0540A3D5 
X-CRM114-Status: UNSURE (   8.75  )
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

SGkgSmFuaSwKCk9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDEyOjA44oCvUE0gSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBCdWlsZGluZyB3aXRoIGNsYW5nIGFu
ZCBhbmQgVz0xIGxlYWRzIHRvIHdhcm5pbmcgYWJvdXQgdW51c2VkCj4gZHdfaGRtaV9kd2Nfd3Jp
dGVfYml0cygpLiBGaXggYnkgYW5ub3RhdGluZyBpdCB3aXRoIF9fbWF5YmVfdW51c2VkLgo+Cj4g
U2VlIGFsc28gY29tbWl0IDY4NjNmNTY0M2RkNyAoImtidWlsZDogYWxsb3cgQ2xhbmcgdG8gZmlu
ZCB1bnVzZWQgc3RhdGljCj4gaW5saW5lIGZ1bmN0aW9ucyBmb3IgVz0xIGJ1aWxkIikuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpJIHByZWZl
ciBkcm9wcGluZyB0aGlzIGZ1bmN0aW9uIGZvciB3aGljaCB0aGVyZSdzIGEgcGF0Y2ggYWxyZWFk
eTogWzBdCgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyNDA5
MDgtcmVnbWFwLWNvbmZpZy1jb25zdC12MS0xLTI4ZjM0OTAwNDgxMUBsaW5hcm8ub3JnLwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
