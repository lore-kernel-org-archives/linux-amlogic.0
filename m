Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFA1C5478C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7NlKlvUqLZ7LVlHD8rsd43uKYh5k8yAR9qeEybxo1A=; b=H4ejCvcp15iXbb
	h7sPM7dlbKlJquRJi9CTRndZznc3djmdEClwp/1ehPHFHqQNsPpabAQs9e7Npz1AuWxE+fsu4O4lG
	GkQ7bVH+qzgztO9g3ARwM6ycbiOVDk62bcX/021Ech3Kh1mlxWWD7tVUk5htFOq1f/aLxUhYinzaE
	u+sIhAEIvvaYqWbQg4h7olcKYXsVobdjqwQl33vSrgZ8EZqqZx9y03eejgmpxSZCaYWGKTb1rsnxh
	riUVxJJLMEOV+zzl8IzxJumcZBdJnXb9mrZu29JaOXFAMp3ev4Rrazq9DZXaq3HA2An1WukFyKl1e
	7CEV8/mYaC8IcznLJzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refa5-000000029jR-1baT;
	Mon, 26 Feb 2024 18:20:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refa0-000000029gJ-2SBH
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 18:19:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4129e8bc6c8so17121375e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708971592; x=1709576392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYjZkD+0muyfme0ZAvaQZRAnb6hcDJgJvM4YVzcOSBg=;
        b=IT2VEWlr6yLJCxSA5MjMtX1U940WPNiljG1dWzLHoYDQD+DLlLHU1ynv/gKoC4qJs0
         lFzZuI4d1xOsyCsvo6ltoUER23emGssKedDhdjRDxJXcnYMyidTScYr7JonxXwlsk0lX
         P90nKsJP+4QayosO4buw+k/voGLwgam1MoIdnpTWP+MJeW2giKfnIDYJterFb+oLkgK2
         JTAg40bk1BBnslcRsUa/BygQoauh83C8vQuKIr5OdSpc6+pc4zN112nLkhqwPkShwxZ8
         ZGp+4+U2NI7tpNkyA388ZHDkze26h5VdZMs4R+5PW7Ech8OEGoZGoXo8MaoHV2dL/bi3
         7g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708971592; x=1709576392;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYjZkD+0muyfme0ZAvaQZRAnb6hcDJgJvM4YVzcOSBg=;
        b=DufAno/lS0DnHnxpgqoFQlp2Eb/3DVFBRW/vIuqpoV5FSH4LXiadtUq8FNB/P57vwu
         Kf/Jc/Cl5koxzQhOaCrzhkXzJnb6XOYeY3iM3+zu0OA/XnZ1c5yGngovvkD/wJ40m3wG
         tJD1VO2NmhDKhCHCRPHLL/VLZiYtD5MFmbMgO1UD1K6O07lMu+qvUzrgDtyCb4oDrAPE
         f9N72oepL+TXTBKfLXqzMi7M5kvkrTbxhEv41uDZICe5jps1jumjHitwEkKQRiTesA9o
         wN195Z8tdnW3XJWMqAoCnzJdYG3Uit98w1dpGJZi7Q/Y/dgTvKsbh6tXql1Wiqt9J3Sz
         /xcQ==
X-Forwarded-Encrypted: i=1; AJvYcCURlGx0X9rMcrzkwm55z5shIXgG8ziLxDpphCNR3Gs8PoQDkIHoYnTSc9cm5PweooJ/ozUZXTwlV3uMJWXp/e0f2EZkFRX91mlw2qAoVvV6TZw=
X-Gm-Message-State: AOJu0YyN+kurQjU4N2+hNmMObPNnVL3BoKqjLwSfopTcaTKsk6zQf9ix
	RRX1kYvrNaUJ6Vvke/a/hyhPUhsq23E4Nqa8G8fYiizXWVAw6KmIF652RiX0Xak=
X-Google-Smtp-Source: AGHT+IHd4q24wEXN+ZHmPow1e3uPSDobPnHsBEDUab3+mDUNHABiOsz6pyHCGDApLnilqTkrgTRdIg==
X-Received: by 2002:a05:600c:4fcb:b0:412:78c8:b31e with SMTP id o11-20020a05600c4fcb00b0041278c8b31emr6525048wmq.2.1708971591932;
        Mon, 26 Feb 2024 10:19:51 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b23d:6981:ba6:e52b])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c028a00b004122aba0008sm8846662wmk.11.2024.02.26.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 10:19:51 -0800 (PST)
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
 <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Date: Mon, 26 Feb 2024 19:15:41 +0100
In-reply-to: <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
Message-ID: <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_101958_193326_32C2E4C6 
X-CRM114-Status: GOOD (  11.88  )
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

Ck9uIE1vbiAyNiBGZWIgMjAyNCBhdCAxNTo0MiwgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwu
b3JnPiB3cm90ZToKCj4gW1tQR1AgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0KPiBPbiBGcmksIEZl
YiAyMywgMjAyNCBhdCAwNjo1MToxMlBNICswMTAwLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Cj4+
IFVzZSBGSUVMRF9HRVQoKSBhbmQgRklFTERfUFJFUCgpIGhlbHBlcnMgaW5zdGVhZCBvZiBkb2lu
ZyBpdCBtYW51YWxseS4KPgo+IFRoaXMgYnJlYWtzIHRoZSBidWlsZCBmb3IgbWU6Cj4KPiAvYnVp
bGQvc3RhZ2UvbGludXgvc291bmQvc29jL21lc29uL2F4Zy1maWZvLmM6IEluIGZ1bmN0aW9uIOKA
mGF4Z19maWZvX3BjbV9od19wYXJhCj4gbXPigJk6Cj4gL2J1aWxkL3N0YWdlL2xpbnV4L3NvdW5k
L3NvYy9tZXNvbi9heGctZmlmby5jOjE0OToyODogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW8K
PiBuIG9mIGZ1bmN0aW9uIOKAmEZJRUxEX1BSRVDigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCj4gICAxNDkgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVM
RF9QUkVQKENUUkwwX0lOVF9FTiwgaXJxX2VuKSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+Cj4gL2J1aWxkL3N0YWdlL2xpbnV4L3NvdW5kL3NvYy9tZXNv
bi9heGctZmlmby5jOiBJbiBmdW5jdGlvbiDigJhheGdfZmlmb19wY21faXJxX2Jsbwo+IGNr4oCZ
Ogo+IC9idWlsZC9zdGFnZS9saW51eC9zb3VuZC9zb2MvbWVzb24vYXhnLWZpZm8uYzoyMDc6MTg6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvCj4gbiBvZiBmdW5jdGlvbiDigJhGSUVMRF9HRVTi
gJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAyMDcgfCAgICAg
ICAgIHN0YXR1cyA9IEZJRUxEX0dFVChTVEFUVVMxX0lOVF9TVFMsIHN0YXR1cyk7Cj4gICAgICAg
fCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRy
ZWF0ZWQgYXMgZXJyb3JzCgpBaCwgSSBmb3Jnb3QgdG8gaW5jbHVkZSA8bGludXgvYml0ZmllbGQu
aD4uIFRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93LgpJJ2xsIGZpeCBpdAoKSXQgd2FzIGZpbmUg
d2hlbiBJIHRlc3RlZCB3aXRoIEFSQ0g9YXJtNjQgYW5kIHRoZSBkZWZhdWx0IGRlZmNvbmZpZyBz
bwptb3N0IGxpa2VseSBpdCBnb3QgaW5kaXJlY3RseSBpbmNsdWRlZC4KCkNvdWxkIHlvdSB0ZWxs
IG1lIHdoaWNoIEFSQ0gvZGVmY29uZmlnIHRyaWdnZXJlZCB0aGlzID8KCj4KPiBbW0VuZCBvZiBQ
R1AgU2lnbmVkIFBhcnRdXQoKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
