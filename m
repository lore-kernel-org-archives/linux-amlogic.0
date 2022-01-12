Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC4C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhf+VXBVYAUZA76pwt7FNhd6zENnmChBq8vT03s01H4=; b=yT8INDNJ3qA+Xx
	IQ9lNmjwHruFYZdlYuBUI11qItjCniaD9dxnLibCJ0wfFezCj5/3x0fw6u/Yooq0raylLyltl4aIq
	uht9wC9TQ6/KXLd5t3/wU5mUe84uadQCNOfe0BFRjwVas9vJ2bAGUKqazuvSr60WImRiJKYR93e4y
	tMCeOIGMRtTInqHp3rEI8rNayL23kT/nc6Vc9f2FyRVaZwkqnWtKYBd2iwzoqLBB33M/Vg7Hk88aa
	YGfzDKJcRorIkiYeTAqqJ0KWDvZynaDucVoLe+SZ3w6NdteFh1JVgASlsJpBm3ZWdV6+EGBj1AjYG
	9XSx3QJOqJhe5YFtokpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Yzo-001WNn-Kh; Wed, 12 Jan 2022 08:28:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yzd-001WKN-Hj
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:28:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id l25so2675996wrb.13
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwC54M20s1dVwJYZKIeIs2e8spLyvokky9vZwJUb9ck=;
 b=x6/HKkUeityEVr4mhv//xRzAfioo36Y/WXkvvyvxwyItbtDGVAk+0yaRroBkd+Rnsm
 MPQyeEocgqk0Vv6ZSN6T0fVXM3Xi+NmccVnOLqGF293nYmL1dQvNbW42V7VRtMVYKkH4
 KJ/b4AitjIvXYrwaeTHgrMyNoMyIIjb7xVVjH0bp0aYq25Ttie+TeiWLEdDOKcO/HKzQ
 +T+pYpidUnrcsobEJTV2KAB06hfEFXIBlOjd/zRJQSIBsPGtndselWoIzQFI5P1/XOXc
 bMTPg+u1zkwOIgKtk84X+ATw/Yb2gCpIomM/L5cHLRdKq/l6DTgtN++FQ5rjeE7mgirS
 0Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HwC54M20s1dVwJYZKIeIs2e8spLyvokky9vZwJUb9ck=;
 b=6o0BQrm+vzbKLuElcp1iSfiDm4VQChnAbBmg0+I0ZgrjJAWtyPHhy6rR31BQ08yu8i
 b4mgXac/7FjYZ59SI2QTEMo5bJznlqPER3LKg+7uXOHTNJ7RXfo+yFBDtMumcA/WUAuz
 fjrzhTWLbZVIm1PdRhXFtChQrBY/4oGijCB/+cfrcrvyWJo4UgzdrJPe/TRKxUgbIyuB
 k+844gjwwwxhaqgSHM19o7/6P90b9ziKFMEnXD3HbLLK5frKzDRlq0KVg3RrpKuRz1id
 jWOXu2RImz7+2b6VXQdgoUPA8oqipmcV6J2r4tX5BYd20EYB5xfEQ1ka6/10IOUVg5t2
 gS8Q==
X-Gm-Message-State: AOAM532AtH4CqB3v/DF41UUWYj8LRgfu72cIw0/zGMiu6oQcdVIDb3c2
 Pi63zkoueJruN0rBjym0b8sk5g==
X-Google-Smtp-Source: ABdhPJzc4CgOuLpsEHWv104iY0/uJKOak1yF9w2ZznHxADOXpB3TT9IcUg9Tc6+20UXeADP60LdIAg==
X-Received: by 2002:a5d:40cb:: with SMTP id b11mr1151301wrq.79.1641976108000; 
 Wed, 12 Jan 2022 00:28:28 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id v129sm254846wme.29.2022.01.12.00.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:28:27 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, christianshewitt@gmail.com,
 gouwa@khadas.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, art@khadas.com, nick@khadas.com
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Wed, 12 Jan 2022 09:28:23 +0100
Message-Id: <164197609473.825600.7789792176979118539.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215030236.340841-1-art@khadas.com>
References: <20211215030236.340841-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_002829_607984_6256FB56 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 15 Dec 2021 11:02:36 +0800, Artem Lapkin wrote:
> Add spdifin spdifout nodes for Amlogic SM1 SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[1/1] arm64: dts: meson-sm1: add spdifin spdifout nodes
      https://git.kernel.org/amlogic/c/86f2159468d55aca1793c1f0f3d95213501b32f3

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
