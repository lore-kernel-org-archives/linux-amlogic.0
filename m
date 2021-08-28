Return-Path: <SRS0=4hoi=NT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3ECC4320E
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 15:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59466054E
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 15:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E59466054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TloRzD8jGGxApFj92Q2aSA+grKvu+O3Mxd9pujakiYg=; b=anh6tvxTk/4n/s
	hqms+9ojvjgTfjCr43QHRXScdAzfrJ3hDrH9TY/7r2UbAaIdrxunCaYUwmBkO5FVWBNZUmEBq66uH
	btUMw0KJPWUrf9k7GBvEOWXOjURi+UVYxgp4cnjUgTs3y6d9IjoDz92ut9t9VpGrYX5idTDdlnTpH
	Dw0Chtoc3do2Id1hTUOcd5vHXeVUzDijqxAaik89q37ArL6W13l5VYsOWURKr65NgqYgAtnuxNTno
	KAIt60CT0eTjL4eeZD3PNzS1F28Q0CVwqqcwmcQFRrjRZZXU/j7tUd4JFPiLY4bdijEy3LK1bJ1zu
	/boZgYyxaxELEMRUijjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK0hB-00ERea-85; Sat, 28 Aug 2021 15:56:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK0gu-00ERbz-Jy; Sat, 28 Aug 2021 15:56:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id n11so14512707edv.11;
 Sat, 28 Aug 2021 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvpIahskAaTOBlt+JLrDDDHCDcxjhGW+GXDJSUKJacM=;
 b=YWNcViXUHxUJyDr7/EtN+W3GEuZSkpZEbpafkzJbXpuZbV6HJgrSqMZsJfQSEvfniW
 NGoyc1631d2+pXKy3aa0hPMWcYvvKOJ3dKZN8ClhbpRh8f+lAjC0xPF3Td6/yuepHEtP
 62R0lA6VrxKnwymJmPRzzMyPtvz+sBqY8OpwFyVLdXAZQfDJ+bkIAMEtGm/6ftx6+WpD
 1WbiTxTlzIVoYWEC4Rux43hRGEoryzA7mrXcGQvQzxYX94WtfnbL+CwMK3kVT6eMVRqQ
 A92eBEKOfkaEwnupt8KP5jR8EJtcSJG7M5Av9/VmDCeUN230rvRZG33ell0Y8tmn9rTO
 JXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvpIahskAaTOBlt+JLrDDDHCDcxjhGW+GXDJSUKJacM=;
 b=S5Wco8jtOsvbqcmnb4S84wH/SYCIIbJGIDFlPw7Tt5dbBR1Le+afgfE+awIrl9zW1K
 u7+9BHbZix3hziDFlDSoP6EIL9rsSdORgpFe3NXnxnTCEIPaqDaBZ2UzaNBoHs37JzZL
 PEq9wSpuFi9asNBfgFWUl8c2v6SkXwS3nfKYxG/Bejw+dvbWCnj4sEif+8DqGWelSVBU
 TJesvShdIXjeEjW0L0BepY5gWr6+JaPHUfMSz+LqKvV4RvN8GlwDxDZYVu4rhOmrbU9j
 GjE2NpKpGtONVdTv+kiN21JpJEPMQC1hDyF8HUrvJoK3LunP+ML4fS60R26XqLiqy0Us
 72zA==
X-Gm-Message-State: AOAM532f1kuEcN3Xq/vzeWZLk6wxav4gNfVC2bVl2r4At8SxFiTiWc9W
 /TO0f7qzzstCD9bB1rKey8W9cOG9SRiApYSqvhGMfe4F6GI=
X-Google-Smtp-Source: ABdhPJxzFNpqSCAUZ337fhDSkjiD3TLh/T+GYBk8lHXVTmBrL94/bdOfFeeukR2CrwwkHFL0WzBUJS99chHZzyx+3Mg=
X-Received: by 2002:a05:6402:313c:: with SMTP id
 dd28mr15369640edb.179.1630166179073; 
 Sat, 28 Aug 2021 08:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-3-linux.amoon@gmail.com>
In-Reply-To: <20210817041548.1276-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Aug 2021 17:56:08 +0200
Message-ID: <CAFBinCB8CK8Bn2xKpiAToQQ4K1_W1XZjND9pOGZRZeMp-grs3Q@mail.gmail.com>
Subject: Re: [PATCHv3 2/6] ARM: dts: meson8b: odroidc1: Set usb power source
 to always on
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_085620_702497_AD427969 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Anand,

On Tue, Aug 17, 2021 at 6:17 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Set P5V0 and vcc_3v3 power source to USB to always on
> so that regulator should not enter in suspend state.
Neither of these two regulators can be controlled by Linux in any way
(there's no GPIO to turn them off, no PWM signal to change the output
voltage, etc.).
So can you please explain what this patch changes from a functional perspective?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
