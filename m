Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CCCCFA18
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC3VHWbj/6AACHVrcjxJtMP1GQmSXzMWDKmzGhlBR/g=; b=tTex+UCr5uhZdh
	XwiC7NDglIwxcRQR+iAfJfNyp/NQSpVhOlO4aPalX7brnJay+p4KF0S1slvcg2ki05mEna1Xuo+9k
	KhaaiBhr/vjuQ5Zxcf63lOXUTifRLuIJA8/DUUYG48XI+lLJC1Pn7TTLoNPQwDdovupHw39Rfm8Ia
	kuP4cHFXREesgmHwuRZmDM9JKKgBH+bBq+RN3SiPdJuFt3IP6Dd8LZ1fd4kfe2eQJqnp7wmnFOMdg
	Z4YOq452jgsm2DP88v4wonkcIUKuVtnzb6sLzM2TFWys0nuPVND3B6oNZXWu08jprUQo0nTLakxgT
	WuUW2GyOyiH9GDrD3FbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5p-000000036xn-1WK7;
	Sat, 08 Nov 2025 12:30:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5m-000000036wk-03nD
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 12:30:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297ec50477aso1836145ad.1
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605053; x=1763209853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=XWpJm9NHkzPPhPks5NIb2+zugM7JG+CAr72LfgViwiQoC/t3NTm87tLive9IgrYLEt
         EImk3/AC805VDPQV+ynKB/Qm+lTdamiRVwZvprwGXgPzPoe0R5MeNXy9gDS7OwPXXiJE
         esMghM30c9fXlFijjuskGcfgO3lryDFWE3TGlxpgxY/uzlrbzt/Dg1zMrOk8ZnXbwkd/
         SR+YZus4gGy9OM3QI3IFKAOxhGqHGWWJo6nFCUc4KEnYwQyzOB5IgeqyBM4YF3V+Fcmx
         qksMQWQEA4XWBP0jgjL9O37TjwLo6rjtO5z3v/Qu9Y6/fMh+F6fQ4RBN7pKKNxQAqyvV
         EvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605053; x=1763209853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=lgVCcRIvx8hgHwD816bD1ghRrG8NJ0M/ph3uSoWLxEMNuRa/icN99xgEElL94+lgMX
         Svsxlaww/MIlN1EbAW4RLwjwYSne22fCJhF9iW9LzTNiC1hrZ27zbxXFSQmnOrMPMiwI
         o7GYO15YmtNu9hfY+zf26GK9B/GiUcbxoMh1zO/xxrWwAYKkUQCiaf66I2mHrPOggbLB
         wcEYdzrVh/edw/ezt+oByzPoM+0FWXOK+usOrhIaStd2ZRkxgMie/k/V27NLypErUSqy
         /PpMkYixikrqL5J6S5NYqBYcWJCZxE+4pxefZDcyc/Cc6jGHdoE9DRcC6da2ZeFRunqj
         z3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu4WqWDVY/sLVUxaRgPn7/HIB51oQHghXoOS8qxypYBa8WkrOrrzh9HfzPj4LOfpBMTogz59w3v0b4jkhI@lists.infradead.org
X-Gm-Message-State: AOJu0YwV2zqYWj6Y1CJ9UTBYOjL93DGKVCZuabAbGHU7lwT2wlzUDtxS
	EkBWhq3AbQ3ZOFM4Ed1wZssmv1NgHvG924eI9dke9j7X4j9pbXS9FI7t7sW2Ck7CE9fs9dMwAIv
	AycZS2gauJCMOl6cJGURVsPcS6MzCBZA=
X-Gm-Gg: ASbGncuRiWD1/4qWaSY0fmfpU4WD/8rW0++20LqYQmhYO8YpKG8sy6xpS3h1LlvPbsM
	tIjYf1lcSNlkUaK+AjCUnkSKtyn5LBWVN2WK6D+kSMT+SlAtziuN/S3+0s/N2EswOpUU3y7e3kn
	GfPiPkuvrHK6YeXnXDwVuBIjs/x+h6uSBUj1zjKJudlAdsOsrJm671gbRVK3nbDDc6ItwAgPxy3
	AMNHmq2uwYyDDjJayxhYyoB/5mk8kXBIs0bHGSNlS2JXdJT++PidfgTbwP9rvsPKq36Jm+B8+TZ
	g2ER9qWvZ0LXy3IMyIJ87uYmCtY=
X-Google-Smtp-Source: AGHT+IFggAiteVIarAA4yH7nX7bpSEtb/3RAGcM3xV3yeTnEsgYxWgJ+blB80el3RONC2EPUTf3q2DoKMIlCAJuDAHE=
X-Received: by 2002:a17:903:1a2e:b0:295:5da6:5ff7 with SMTP id
 d9443c01a7336-297e1e3409cmr35315945ad.15.1762605052702; Sat, 08 Nov 2025
 04:30:52 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:41 +0100
X-Gm-Features: AWmQ_bmyclexD2i-9GELP91SUMtxA9fKus1hhuyJQbz-Kh7t3dy3c6LqsK6hIg8
Message-ID: <CAFBinCDf5jMMFbkRCj7jWOSB__jBpQN5FWZhKAgdoELeKwW+Ow@mail.gmail.com>
Subject: Re: [PATCH net-next 07/16] net: stmmac: meson8b: use PHY_INTF_SEL_xxx
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043054_342053_E66B45FB 
X-CRM114-Status: UNSURE (   5.23  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjI44oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgpSZXZpZXdlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
