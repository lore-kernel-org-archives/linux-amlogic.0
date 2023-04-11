Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F13C7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86KbuahgG+h8gxhD3yWQpRvOwihpjA8qkX/D6Xhqelo=; b=lUObtEef5tfVZm
	noBFcgp09yJOjBzr4mmKUk8S8hwA3gbs39lD4vybjyTde5+fuOVEtLN0860cAxOgbpZ0XJPTGPECi
	O98etMza6MqYnIJgb1fPXLGeWoEzYYBCQPtmAxxbYUatuuQBduxGMmzEv/xSM3eKgxLXULskkUWje
	NDuu5BJAk7I5gsdm01kI9dXxJscQCWBnJvYqrAZc2oMGf0tdQZD02mGR3aG9iMUMkerlzKhuXDqko
	x3hb385q/9joOctZvc65YAgACURanzy/xYOs231i1Sbd/zfPnGLpOsOgrwDMdm5PfiZoBmDTCG94i
	cNcsXv+PpDKm/WnId60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJvX-000ynh-34;
	Tue, 11 Apr 2023 19:45:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJvU-000ymi-0U;
	Tue, 11 Apr 2023 19:45:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5027e589e20so4818948a12.3;
        Tue, 11 Apr 2023 12:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681242308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16DK7JVkIBKk1X1RnBApJrHcGzylPyjEeubCA97lzVA=;
        b=bqo0K8x6PYNDLuglLAzdr8URi5f3vLumuQ8FRRpT9si/x+FYW/o4xDl/IUC58UVmZy
         egScxBPEI+AwN8OhsXRx008lIkZkd3FKrdGM5tm9EMADbkkCTAVW2D+Qf2kKu+pdyn9n
         ge3q8/enWjEFHkgxmycXsSRGo/VeoSI8lbccjXnvsG7SwSFics0UStpE9WouIFqiWCiu
         RrMWFNR9OgzftJFVO5Q8P9H4NtFvmJFRnL1pB0SLs3CcUr4fJoD+oPEuAN0GgqDf2oQe
         gIlYyP5I1mv07vyKiKE3T0a/ZsZYH8CVFUXydtkZZfLCybuPHklCeZ+lmp0BYPjMHAPx
         oSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681242308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16DK7JVkIBKk1X1RnBApJrHcGzylPyjEeubCA97lzVA=;
        b=OZeQonmL5Xj+78aijzIyk6l3e1A6iGDDWI34KiMuexBrF8MmdiXUUtHm4lhpuCh4EQ
         r8VCr3yrOVtX6j/FIXFGS+nzIHyTmPIKvqSpZ/AfVw/U2ASbhjWDN+QVxs8em9J7rZtf
         vbkEpm/k9HMY6fhMT87IRL4PqMo554Pwjnul2sy++aksHoUwTWVSrXEonxDDdC2adERf
         PsEze7ZnVdbGDRqwK9fFf5iGBAc8BR1A13HxzCkKFRUiBlR3bifLfAaPNZ+1JPsbbPM1
         adX/igQsrZ3MHK2CPVYfPtFihbXhL7BFJtTTJ4AHHO+8CJ5wE6FHfuMXGTD9Ck3lLyj+
         pGmw==
X-Gm-Message-State: AAQBX9ftbvC0g0Hu8PGfpLsalB0nNevCgzC0bU/hLkyPhr+gqMeuuhZZ
	mxzcGP79IT9lFfG6NoDRYoQogIZvyfKAjX6V5pndbKIi
X-Google-Smtp-Source: AKy350a6qPIedDe76S+SXxuTWn9C2oeOWwUieHap6qzAfoMbTcOAzs0i5Ia2U8POkmAGXxy1cfSmKg3D0EkmfLJ3T2I=
X-Received: by 2002:a50:d69c:0:b0:4bb:e549:a2ad with SMTP id
 r28-20020a50d69c000000b004bbe549a2admr5550761edi.4.1681242308080; Tue, 11 Apr
 2023 12:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com> <2760498e-23a6-f787-bac2-0460566a995d@gmail.com>
In-Reply-To: <2760498e-23a6-f787-bac2-0460566a995d@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 21:44:57 +0200
Message-ID: <CAFBinCAWs=FT1W+ckneOpZZnfSNZYODUhMNXUB+1MzKqKNjtVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pwm: meson: switch to using struct clk_parent_data
 for mux parents
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_124512_208913_BCF2C1EB 
X-CRM114-Status: UNSURE (   9.10  )
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

SGVsbG8gSGVpbmVyLAoKT24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgOToyNuKAr1BNIEhlaW5lciBL
YWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2UnbGwgdXNlIHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgZm9yIG11eC9kaXYvZ2F0ZSBpbml0aWFsaXphdGlvbiBpbiB0aGUK
PiBmb2xsb3ctdXAgcGF0Y2hlcy4gQXMgYSBmaXJzdCBzdGVwIHN3aXRjaCB0aGUgbXV4IGZyb20g
dXNpbmcKPiBwYXJlbnRfbmFtZXMgdG8gY2xrX3BhcmVudF9kYXRhLgpncmVhdCwgdGhhbmtzIQoK
Wy4uLl0KPiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IG1lc29uLT5kYXRhLT5udW1f
cGFyZW50czsgaisrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXV4X3BhcmVudF9kYXRh
W2pdLmluZGV4ID0gLTE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXV4X3BhcmVudF9kYXRh
W2pdLm5hbWUgPSBtZXNvbi0+ZGF0YS0+cGFyZW50X25hbWVzW2pdOwo+ICsgICAgICAgICAgICAg
ICB9CkkgdGhpbmsgdGhpcyBjYW4gYmUgbW92ZWQgb3V0c2lkZSB0aGUgbnB3bSBsb29wIGJlY2F1
c2UgdGhlIGNsb2NrCmlucHV0cyBhcmUgZm9yIHRoZSB3aG9sZSBJUCBibG9jaywgbm90IHBlciBQ
V00gY2hhbm5lbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
