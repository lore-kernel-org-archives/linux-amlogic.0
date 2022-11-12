Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E1C4332F
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Nov 2022 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlTwNct7JvEj0ZXSG/Mo8HntKG6C0vHm6OAiG9CVFlQ=; b=nJTZq3i9KjHuOT
	K4OlV07KrIz0Q8wp1P6Od/obel2nYzVFH3zO/zv8fA/4stzSDOIXqFJ/OUn80v3NKhhBDfc0Qgv/A
	0DHp8boydjSKvwICbvtX9sdaYbIPIXo84j4dTngDhbsjr1GgsOIIN2UFRjS8R4r4pTp9Ld34mPD+E
	jtKw7KcSRzWhDQh9pVhpK0htMS+mu8yg23wom2cyo77Q2kcJLHTl8K1QSpvM6YpKa5otIPO8nHFxU
	rlaA3HORYrKhTIS0PiM7ENVU4t7OkcXGCyEvmLGaCzWjORCpZ8Frvzmb1ycAa3yv1poKvquSewGhr
	cx7Osoz01n7izAHSpeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzTm-008IjJ-HY; Sat, 12 Nov 2022 23:00:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzTb-008Igw-DU; Sat, 12 Nov 2022 22:59:52 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kt23so20214969ejc.7;
        Sat, 12 Nov 2022 14:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwUb/APyWuW1/kclxSS68ZW9lC0Hlt/bCdjo4FRubHc=;
        b=bvLJAI/b1EMO5ZIviIHZQnMVUmbZ+2sW/NG8o7YlSOehG/WFae6ye6fILVMLqw9IgU
         2+iLDiS70uWVF0RIEyONdL9a2RZ3DQK7lQO/j0ZowCKIt4i1JlsWDt9w9ZKxKpejg6ml
         Ne5uayImLJ6TqOTTUUVofoOdC9Jg6R1FHBqKpifCPc7/7dMu7bsgmmpyKSEEnmlubGCl
         yvEguVMk55xru0YBpXKG4sE6g1OTMwRnWvFdrSteX7IUcE4IqFaXJd78L5Jok0qUCa9+
         respKjRT4RjHqc1+mS2ay69bWRhuJXd39XTAaKJtvQkCXcsWscm7FTWZUoq/xXK0I4su
         MZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwUb/APyWuW1/kclxSS68ZW9lC0Hlt/bCdjo4FRubHc=;
        b=2xyF6DSAm/3OpyvNyQcHRln56whWyI+P9X6Bf9nRBLgStUVvvo5JFpaATNmT/p9orx
         9XXMGZAXdkVNRsujxN08hOUvenh57Y3nC2VMLf8zNgUqMzNVnaEyHpU5mMYChJhS4sds
         cnGXKm1IwKx7f/V6jZJtPiVTAVHuA1rl6pvCvwL4Vb2fo7d+demZE9UqqZFgj/ZocBN2
         8E2geb+teKvJ3bsSixubO+Z19pd+N8VxODvVOpLOmFKhYXySluzDZTFgy2Cl1W9L8BK4
         sXjlM/kl/g6kguDlbzIKga8vETOcx2F6hl4eO8FixiULHsPT0e05rIEQcYUFO0XEZToZ
         tddA==
X-Gm-Message-State: ANoB5pmpAeUdd1NiTbeGPTq0AJMVD3NL2LaVaMUfhZm1w/dju1LfQFX1
	WKLPX6xJW/zbt3YanHARPkCc3Oz7CZg1evbnyehwpaYw
X-Google-Smtp-Source: AA0mqf5hbdSoTmGDxzeKtYkuV8yK7LEKAQby4WPcWMwPXl2OjSCB76ngcb+yRGLGT9dr2qqCyLRrpIF2EJurN0P6y9c=
X-Received: by 2002:a17:906:2ecf:b0:778:f9b6:6fc with SMTP id
 s15-20020a1709062ecf00b00778f9b606fcmr6409555eji.580.1668293989543; Sat, 12
 Nov 2022 14:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20221110150035.2824580-1-adeep@lexina.in> <20221110150035.2824580-3-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-3-adeep@lexina.in>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 12 Nov 2022 23:59:38 +0100
Message-ID: <CAFBinCA1a_ZaG0Pb7z=oBgrvfYJ4oJ_uJ3SY-ddjAmzCSbGmVw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: amlogic: mmc: meson-gx: Add dts binding
 include for core, tx, rx eMMC/SD/SDIO phase clock settings from devicetree data
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_145951_483879_6E479F6F 
X-CRM114-Status: UNSURE (   8.98  )
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

Hi Vyacheslav,

On Thu, Nov 10, 2022 at 4:02 PM Vyacheslav Bocharov <adeep@lexina.in> wrote:
[...]
> +/*
> + * Cfg_rx_phase: RX clock phase
> + * bits: 9:8 R/W
Generally register values should not be part of the dt-bindings.
If we need to make the phases configurable through device-tree then I
suggest using the human readable values (0, 90, 180, 270) instead of
these register bits.

That said, if for whatever reason we need to have #defines for this
then they should be added with the dt-bindings patch (and also carry
the dt-bindings subject prefix) instead of a separate patch.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
