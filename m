Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7915ACA0EDC
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+x7Y8oVNdjzNoEXVUOGFp7d0K81Bl6PKowwwKAxhIE=; b=BWX/nrxosIHwhq
	V3l1rDohIQkItD3GowdvI6slrl9Df5mshLD+fJIlTMDfmq77f+q6G4P71Brt42UUkytDkP/lyaal1
	GudWzmYg4F43jDQPzmlDrZUGC6yOB+8F9Hot/Bf5Ngav78yXJwfQrVoER+lLNxT60o0zXk+ob2wma
	3vBc39h9v/ETc5gJ4drEbuK6iZHoAL08cezx7n5+tQ9bBHrna8axq51D8LfKZK+VWNP+jNsDvxPDC
	GCYzqKVAz5JvwcN347sK30RgKcSJwIQOTgEOKld+cmuEH1hvYJrorgLRazJxfy0Fjdsneiy7Aggg9
	FzYBwki/g0hQTAXVMy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdLN-00000000PIr-2kcX;
	Thu, 14 Aug 2025 19:10:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdLM-00000000PIV-0pLf
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Aug 2025 19:10:33 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47174beb13so873926a12.2
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Aug 2025 12:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1755198631; x=1755803431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ic7fVgdgQ8MblQFjMCCiNuHrsFYD4KaCcqXjlfhrB8=;
        b=FXh8A1bpHLTy3xZUgRsvOv6l7N4aCpHdbv8dKWaUFPiEQ8OdlVm98UVjHwt44DuXRA
         9KBMkPfQZ29YqrCusDpSwIWKpT0NMdAGaex1dMUz5+gyFi9FntjAs320xx9CGn5v4zWS
         70eaoGO9H0p27VtFTHynCI1F7CQqUpU57S0HUtV9nft6isoKy6Q0aTxpTMgxUZXtF8mx
         8QQo8vWt0wEZcpMlrsJjN7GmG3k1cC2HdB+XHVR+LFMVeQLAwFWTkJ9UcE1WZ4DLpLWj
         g93FqlXqUE3EAFdduT/C8Fs+XD/OlfgphX1uzigCLT2Nmbxutuz0UrFIa91lkAUCymjk
         uClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198631; x=1755803431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ic7fVgdgQ8MblQFjMCCiNuHrsFYD4KaCcqXjlfhrB8=;
        b=oSsADP2xk4KbzmLTXEIyqaSe/XaPhhgZpxC7dwgLei4cDTVVsFxnMQtOADOKdrNO0c
         wHO/+GDGPi+rzk+2MMl4wQMkC3ohxzZw/lxQprMHxQ05YXmm+Bma4l+D0GZIbsF3g8cE
         mcDKKt3rmmXjHfei8FqoB/x9SUxg5hyY8MxZLVzj0SmJ6po/i3wm5egC9ifY9qX7Uhcb
         gislOx34Gmq0gPNrFyypuAINQTbRgkdM2lyYoL3TvexFy+cgz2tNwEZA6Dz4SWtphIEF
         BVZvszMQbZNnt/exVmsA+UyHSOiLROMfOXbrIrPmoGmsKi+hnkAGUSxTm9L4U4j2sAkT
         pg4g==
X-Forwarded-Encrypted: i=1; AJvYcCW6Iucj197jKUFMoCieglwdQavMggxa5IAOzLHtagnABouxctQ9d/nCk3iOEhfULQ4TCJVddPwBlk9Hztej@lists.infradead.org
X-Gm-Message-State: AOJu0YylY4na9O5A3EeLTkaQXthK49E1hbanhJu354SUDkpMgTQYN8so
	zViySX5rBNsW49/jzN/uXGpwwJIDuras7PgIh3buvh/Z5yLUinw1E6SeGy3klfCjScS4u3ftrLC
	nVIcTclOlr7+sxy7ScQ3lNbwzFJR6+qw=
X-Gm-Gg: ASbGncvCmeMvRoyn64fg3Ei6TeEm82xs93+iSTmbqqUnNkOEBjHfI0u5T5RmC7rtG2q
	T+YKpPemhm14Z615Top3zIPlphT2s3tjtZF2rq7a6GGFWOM4O4Rw1EQJq7MPel2BFfC1dXSQfB5
	Ji14s8zriixMvcT3/t52ycXupPV62PjNzee8qerNths9gRwk5f3bi84HmnOmCXr6GUzYkEEpHHo
	zZW6+HZTeX0LBO0QZskv+kgoG9ltgjR1MKOtXJI
X-Google-Smtp-Source: AGHT+IGCkVCFwHi3iu3RTkUkT3KWCaKedVBq8LMJeylvVrEEx6RjEVwapMlmkmou0xfA/EzyS/n8fJ+FeogGpmfch5s=
X-Received: by 2002:a17:902:cccf:b0:242:b315:dda7 with SMTP id
 d9443c01a7336-244589fefd4mr53592755ad.3.1755198631063; Thu, 14 Aug 2025
 12:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250812092908.101867-1-zhao.xichao@vivo.com>
In-Reply-To: <20250812092908.101867-1-zhao.xichao@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Aug 2025 21:10:20 +0200
X-Gm-Features: Ac12FXz3DsOF41iVXZ21DRUi5sZbQZVEuhx31cU5DqXvUGLAmoyIN49sur7oF4Q
Message-ID: <CAFBinCCrC02K8v3FbDzGTQYbPhC9RrJC3cnbuHLjJz8+AuV7jw@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: use PTR_ERR_OR_ZERO() to simplify code
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: ulf.hansson@linaro.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_121032_238543_514E0D6E 
X-CRM114-Status: UNSURE (   7.12  )
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMTE6MjnigK9BTSBYaWNoYW8gWmhhbyA8emhhby54aWNo
YW9Adml2by5jb20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBzdGFuZGFyZCBlcnJvciBwb2ludGVyIG1h
Y3JvIHRvIHNob3J0ZW4gdGhlIGNvZGUgYW5kIHNpbXBsaWZ5Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
WGljaGFvIFpoYW8gPHpoYW8ueGljaGFvQHZpdm8uY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
