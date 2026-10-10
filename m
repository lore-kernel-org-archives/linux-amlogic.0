Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B97CA9EC5
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8g032KOwL24e0xou1Gzn00I4OWbvwNPUfwexC1IA4e0=; b=RwbTz328aYovZq
	idPH6/m5HLDMa5ZCIHT4yFFsx7KfSOkuo5B4tsCZYS0xfpZtLE1ZaHwux7oY7W8Kfp5rRHNcuT/bY
	+lW6NYQLVVPERRwYV4DP7bngHm5cbCtW7jR0K0x3LuPSA7+/mVv9/WdlmWcmAb2AzGVfe8RFk2p/4
	CmE/K7gtjvZtNxyGI6hYNmZ9qqhRBEGYW0cbJQtO14tyHobL4oMKkw7djTQr1IUDsMihgGtPGInbk
	Q2zpDQQ4XaQgKi8dq1Bm4wdHRn1IFHdJUo+e6YeLm2oK2s308P5DizePxsRGldVmKJvBFYzSI0mkT
	RuvubE78qZflPkELFxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfo7-00000008VgU-0D8X;
	Sat, 10 Oct 2026 22:44:47 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfo3-00000008Vfm-49T8
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:44:45 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-677d35fd168so547598d50.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672282; cv=none;
        d=google.com; s=arc-20260327;
        b=fFx+4NI2i8UzBdY583Ea8aCHcOivPAXNMecuyz68r+EPy5q/MWuZvZ5f0OdDtQMb61
         3JVREovYQFUUE+AwgbVI6iC5vJOm1ucgZrRudRHhU8R7zVYo2yH0C4Uzyx6y0IrUivXw
         84jHcYRbJGRBYIyMx0qgWZGSRrnZgVXEQ/KqT1tSSOER354dzLy1EzkGIN0Nvp/lkQop
         Zealq5hRux2RxwGjX8cBHoQOafqM0rCB02KhJLzLWCGLwVp1jaY3qk2/Bv7Nhn2DwsSJ
         JDCsPqEq5xfCNAbBBccjGaeadKMJ4OjEUkzPS7aMSMJdnmL2MCse7XQ1Ma0lhLl59b2o
         4qIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        fh=8PRG9E3aNwf/jIOKcpoXIqdN0BZBc+Fij69WhqsaFeQ=;
        b=XWLrIqpf48TXXOouNyl4rTHeERyv5IsE1xF0FjBejs75pQjrKyJyM7yNgWxT2c/QsK
         kNDvZ/8gD+Ixo5pqxUdd1Xu/2jNKH3QYmb9V6nvZMeBpNbX3iBRxkxlJO9bMmKw5Q0Zd
         IeY7rquN1a95MS78yxfLk9xHHUvAaa53DpO7g62EWRMalxb/CFCjWalELFOva5/5t+Dh
         Q5CXP9gt875f9Caz6Hnx5kyXhxVRfp4ue1dZ0ejyV8tqALxIFWZaqjuqom/jhj9Y9V0M
         RkeCXgvIYCR1Q2cZ1GSi1Nrpo5ntsPh3zJb/GI7KVPYNg//gq1bu49tCHi4xSHqxZGCT
         aLlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672282; x=1792277082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=YVJRvZ3sK1QBhYPRgc5y8nhAe4ehznY/h2Se+BF3rVHlhPk+FRrrkJfl3p2J+x2Eq4
         qjuHQ+b/bTIedQKk+m7enZDVM+BV1XCCHcgHQqNok8Eib/QEtmFmuy191I/juYEOST6l
         4jvTRN08vTROD6WtPBS6w0s4aI3gtEN289pDzkwa31Y7q3r8Dw4eG8hTDIkoYpzATYyx
         nSW9EIR26fCNKXCK7R333vNgflJy0GXHQA827ovTVDFJa/XMFWeBTpmKEWXFNekaH4nJ
         Z3WWw3Z5tbM01rFOeih7Fxf6sivQnsOPzv/a0NUGCRhRM8lYTfJoBFTYwKkBtjzMnY/k
         9g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672282; x=1792277082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=dEjh8VNcFtyNSW0z17tfPhrcHPioeuC0BdyuWEBqNKOE4CDmnERXaJ1i3DDWIi7Rtv
         mBVU8krtViwvr/XJGsJXiz8QYS0Syh+NMDIQss1nQRrVMM10w4dq7CEgbGnNPybH3eQS
         y8Nay+ouSHGnAkNN1h3IiFbdn5ElRK4LNr5TAfGNH+3sPgU+JCob8XlPRn7QLrMeJZgp
         87+f2ucH3WM7WRCycTdLgI/yrLjA+hPpF/cy3hm/TcYdO5uPIHUVylVo/YsAzEHytrYO
         fRfT7HdmlMEX3/a5dwI9iwC7Q3KcNLNEg6n9RZZIsZhzY4Fra09ADJ+mhXgrY0NqcWBt
         qm/A==
X-Forwarded-Encrypted: i=1; AKwUvBw3xoy3hQo0rKqO62m343ZJP1NSw+Vmam/isx/+orvSawUSqaxoSmlcu6ZgHUWeAFeGbB4neCSGS/iaQF6X@lists.infradead.org
X-Gm-Message-State: AFq9FYLEviuhzc3EgW4ecvaA0ihVCV7EZXzobaCmhabqA3ubnHCiqwzp
	mJPt1l4HCVLBvmcmboSeVgnlYVnClW9DY/ZHtGkcpOfCgjuohBbY9nMHIBmoeNdHv/20LQNM3vW
	Gfs2zTEdvVtuhsfO0ihf85FbCPDCNc2M=
X-Gm-Gg: AYBFou2Vkrd+/32BuwPN6eDoj+5YM5bHj2jK4MjC+Wy66v4VZkRHpqsPrWP0riPp4Lb
	sakosobq2hTo9IahpNgrNnacPf+jabgcIXAvC5YfIerw7irl3cer9iyHnAPgquAalMzML6woZTF
	ZxFhReAwJQQsIk+0LYSse1g5y0A//0lWhslUB3adHZFGWAkuYLnu87ZhuLks/qYVSlR98514gB+
	ZurUOglPHewph2CPlSbufJ07QHEYmTFTYkd6sAwxhVUtTa5mgNCgzIIg7iItw9lHl1WbMf9sk2k
	6XNh5MWXvP2QNBnduI4bi2eZwn8+mYYYZomg+aoJctT6bJ9F6ZWLclMniLFUkaFeSoMT6q4mqIh
	/gx0UiYzTiyUX
X-Received: by 2002:a05:690e:4144:b0:676:8c58:c607 with SMTP id
 956f58d0204a3-6793606970emr2386943d50.27.1791672281835; Sat, 10 Oct 2026
 15:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:44:31 +0200
X-Gm-Features: AclHuK9SzxfYbidbXHkCFy5EESOculWVRi3ikF-IkFS2nFcOSocjCQZtavNl1aY
Message-ID: <CAFBinCDtwrEpLY7W-VKn=ekCPbwAeq63nDX9y-nuV_TviHFJAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dragon@radxa.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_154444_039518_D31AFF48 
X-CRM114-Status: UNSURE (   9.56  )
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

T24gRnJpLCBPY3QgOSwgMjAyNiBhdCA1OjE34oCvQU0gWGlsaW4gV3UgPHNvcGhvbkByYWR4YS5j
b20+IHdyb3RlOgo+Cj4gVGhlIG1heCBicGMgcHJvcGVydHkgY2FuIG5vdyBiZSBhdHRhY2hlZCBi
ZWZvcmUgY29ubmVjdG9yIHN0YXRlIGV4aXN0cywKPiBhbmQgdGhlIGF0b21pYyBzdGF0ZSBoZWxw
ZXIgcmVzdG9yZXMgaXRzIGRlZmF1bHQgd2hlbiBjcmVhdGluZyBzdGF0ZS4KPiBSZW1vdmUgdGhl
IGVhcmx5IHN0YXRlIGFsbG9jYXRpb24gdGhhdCB3YXMgb25seSBuZWVkZWQgdG8gc2F0aXNmeSB0
aGUKPiBvbGQgcHJvcGVydHkgYXR0YWNobWVudCByZXF1aXJlbWVudCBpbiB0aGUgSERNSSBjb25u
ZWN0b3IgaGVscGVyLCBNZXNvbgo+IGFuZCBEVyBIRE1JLgo+Cj4gVXBkYXRlIHRoZSBIRE1JIGNv
bm5lY3RvciB0ZXN0cyB0byBjaGVjayBiaXQtZGVwdGggZGVmYXVsdHMgYWZ0ZXIgdGhlCj4gbm9y
bWFsIG1vZGUgY29uZmlndXJhdGlvbiByZXNldCwgYW5kIGNoZWNrIHRoYXQgcHJvcGVydHkgcmVn
aXN0cmF0aW9uCj4gaXRzZWxmIG5vIGxvbmdlciBhbGxvY2F0ZXMgc3RhdGUuCj4KPiBBc3Npc3Rl
ZC1ieTogTExNCj4gU2lnbmVkLW9mZi1ieTogWGlsaW4gV3UgPHNvcGhvbkByYWR4YS5jb20+ClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
