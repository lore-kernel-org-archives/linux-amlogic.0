Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1890BC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCiNo8FiUrhj/ZyoWh3OM4F2Ismwm96xg0ZhM449CO0=; b=Fun7OEYMU9InJY
	AKYj5w88RGFOULp6ty9sJbRWbSW6BI1rEGpx34yMmwEc/Zrs+QdMA7dHKzmhNlBJwarH9arszhEhy
	tF+881oHVrUA0LY3NXPWDFVNB9wu3toyR6GhjBxmrR6l6jSNicJIj6vjg8E7fi783QM3OxrBMc5h6
	FAc+c1rfqQqlAWp1FAniuyclZTB0KmBpVGOfrZSLysWayTrv23tKC38za2JKVWew4IajzT6a1UZC8
	6Pq8rsHEpBHK4RTm8AwDHWjOlt3LSFk64wCD0ZOHxVHmmkAMqZ+uayQ8SdlTm+CEqMbCGAu4RFMLU
	tBNI/OUYvxEHL9vHL3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfN1R-002MvL-1z;
	Thu, 23 Mar 2023 15:38:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfN1N-002Mug-1H
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:38:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso1487476wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679585909;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5ztXOldgBUHsTc8vqW9in2DMYhalEKyTgDQj3aqFmw=;
        b=EmtH9hjwZwtp/CoRG5DqjcK1PDdppqYjdBU/tcEjAUJSCYTtJcRvyU9pc0bAadSpuX
         f2Zz27D6wgq6pXIElEKlIdb7TxC6NNqLs0vLayg5N7PqWDdQlZUAUMEhwsqGoRbwov83
         MJQVYa+HbFrOlWmw3zv0rSKC0kJVsfxAhlpKmbHvGpitqEAyHAPXv/Me0ZVF574LYEnw
         xx6kkcwl+j1W7DlS7fZsCv3b6V5jFpJngZw2w0pbS5X0d0NNWDxW9RlXD4rWzdcG1mw3
         okiZsbpgFDgExaZQNrHslacQLwNPeVSabz2xJl0ovGPvAsvwljawInhTdyKV9hlF7ckA
         YqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585909;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5ztXOldgBUHsTc8vqW9in2DMYhalEKyTgDQj3aqFmw=;
        b=Sa8pRD3CUQZzMLccoBpOtHeJ4TBXTUIMeDI4mXSoY7oLGi+5YqdxEaklhtp+My7aOB
         z2Dxu7mKmZ7xQI6LD9QzIigQ4G3BEW+pkV7LM37XmqXLB4Ss0y3dAVTJHeIG7Zy8B8eu
         L4ntq8t7oukyy/YFCXTGOwsv0HNUq+UgqkiSUDgftvysh96xex88QajQ5J9P46RWlPuT
         PCFYH0wu+tmzfJbbVTMSuX5pI8l18YRowOiB3h5w+5pRHzw/bFOqweosTFl6U73qx28Y
         Xl0J/vW2hx3BParMHeTtGW5gw1oaoSFsgZEObYpHeocPP65nNoYVn8CyBqcAc/GpWOVi
         6LwQ==
X-Gm-Message-State: AO0yUKXIac10G+QxXQlGEPfAI4mdYhFSY/dqo1zDZJ3/Q3hmcJGbYRrX
	67XyjitV8ZEgFZluX8JXN1OYD3KuWlunj583S4FXlw==
X-Google-Smtp-Source: AK7set+VQss6PAe6synyGo0wgayIvaotnAe7OyIg0yBYV7MbAcDlxHVTREb0qQyCY0a2sifIb3CsYQ==
X-Received: by 2002:a7b:cb95:0:b0:3d0:6a57:66a5 with SMTP id m21-20020a7bcb95000000b003d06a5766a5mr124147wmi.0.1679585909209;
        Thu, 23 Mar 2023 08:38:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003ed793d9de0sm6929634wms.1.2023.03.23.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:38:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io, 
 linux-amlogic@lists.infradead.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
Subject: Re: (subset) [PATCH v2 00/14] boards: amlogic: add
 BananaPi/Radxa/WeTek boards
Message-Id: <167958590859.727591.8895385261532366632.b4-ty@linaro.org>
Date: Thu, 23 Mar 2023 16:38:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_083833_471076_DCD8BED0 
X-CRM114-Status: UNSURE (   7.86  )
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

On Thu, 23 Mar 2023 14:31:28 +0000, Christian Hewitt wrote:
> This series adds support for the following boards which are
> tested and booting fine with 2023.04-rc4:
> 
> - BananaPi M2-Pro (S905X3)
> - BananaPi M2S (A311D or S922X)
> - Radxa Zero2 (A311D)
> - WeTek Hub (S905)
> - WeTek Play2 (S905)
> 
> [...]

Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-amlogic (u-boot-amlogic-test)

[01/14] docs: boards: amlogic: add bananapi-m5 to u200 maintainer file
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/86e59bdd4d55c46fbe7bd856fa16e27c970f407f
[03/14] ARM: dts: add support for BananaPi M2-Pro
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/4170731c4a9dfb5583d45453f323be7975521c18
[04/14] boards: add BananaPi M2-Pro defconfig
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/d33260a5054b716baa5336f2c788e0e07ae46417
[05/14] docs: boards: amlogic: add documentation for BananaPi M2-Pro
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/b2fc35e5f138c6e7449c925324891dbbb70bb400
[06/14] ARM: dts: add support for BananaPi M2S
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/56a92bd4f443634ea6a50bb4b7269e1c04c9e00b
[07/14] boards: add BananaPi M2S defconfig
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/43c67ddf59ff7a4dc62fc0d4c49fe3d54463bc66
[08/14] docs: boards: amlogic: add documentation for BananaPi M2S
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/40f1eea84e2845deda5ce5fbf6c4f8fb1bb85463
[09/14] ARM: dts: add support for Radxa Zero2
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/3016f6fb9e4c506ce751b36215cc1ac44aca31b0
[10/14] boards: amlogic: add Radxa Zero2 defconfig
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/2c57d114d2716e75fa0b4e8f0149215437f603a8
[11/14] doc: boards: amlogic: add documentation for Radxa Zero2
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/37eda34cb5afb230df00b7ebc74c8164b89cbc4c
[12/14] ARM: dts: add support for WeTek Hub and WeTek Play2
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/b07e8fb073aa1b847e9ceb563b76808c88be2af9
[13/14] boards: amlogic: add WeTek Hub and WeTek Play2 defconfig
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/fcb0fb2bd6d9e4042bed21685da893f5765305eb
[14/14] doc: boards: amlogic: add documentation for WeTek Hub and WeTek Play2
        https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/f097eedf0c04fc6307e22b4b707aa3b47c921b4c

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
