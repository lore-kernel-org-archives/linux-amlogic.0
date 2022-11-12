Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874ABC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Nov 2022 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgcBWYd+d8X7ygh6BJLiNXc2ptTNr4r8+jIVGZeWjzM=; b=fADljZgpldPjlw
	ashc2jmtWrJUxyxGru9ce4bMJOqzV3zEMAwWsxNmcCXiKa/3xIroAaTibwFAJY7Gu1lXVyAsXrgmZ
	6/LIb7uwANxPr39kIpLzm1Iq4cbhG0ApJGqSwO2/W0kqdq5aXPeGx6b7uLGoSdrsqDsHIdCQ5M51o
	QS3T+xXPKK04HmFhlm02U/kgAeaF1gCn8RIE75tAuW8Sg6R0NJVqQpTiYeVvHsgYLDf2lrjGwVLi9
	8DZMDjLqb8O4q7r4eqsbaUMblerl8OdmvPngtAn5nzCXcGqCMNcxLcjguZwg1CgDmdi7W3z+8TLZ6
	FK2FW/MC13P2omc4Z3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzRo-008IUy-6n; Sat, 12 Nov 2022 22:58:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzRd-008ITG-Fl; Sat, 12 Nov 2022 22:57:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id q9so20359799ejd.0;
        Sat, 12 Nov 2022 14:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aces7d3gh1cNZ1+1J7wsg1lJ0vNlC5CU2OQmcL8yCkw=;
        b=gfw+fakuaAtqewolwJkRZapmehXpcSd8l/JmGIId64ZI/VruTHo7XGGyPg6PbMbhRM
         lwHrB5JAJwJB2grGQ88zeS8g4jjqNwVznoiG/vsyYtcnSRlHUyER8YJ8OwnST3WqifIs
         2SqeMr40gzLjARJ6Fgq5aiQs5CoySgHV/qoWBxoWnhUKEdSc76uAgaezwO8JUffiks2I
         2etRqJzrp9IxwHH4qdf6jKZdUDq8ZeM5j/lvtq0zrhbtzmT0l6ywhuHtvm4mHwAcMP0A
         X2O90q7XE2BT1KF/dchGlhk+5miuVkXDlgxRwlTe4FNcZp8Sb+qykZeUFCsbYfdB7p34
         1CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aces7d3gh1cNZ1+1J7wsg1lJ0vNlC5CU2OQmcL8yCkw=;
        b=XmIocR3Y2Z7+Xti+P1jfvDGJxzGu2YCDLTTTHOlczaHPdOlF5ITPQGqpITrPq42gdA
         3mwmMLe5lytU2BLShZG70DODFq4m5EUlu0H5JKLfGdXurFEK2t1y6QKHOIlrPqFuy5ZO
         oonggl18Oy3PV/FNsLDMmg8x/zJrbfm1vL9oT6pxapMlHJCM489xgapYDrE8p8a/nXGC
         GTTps1MBOKQfa9uaSuYjDrsLUA0v6diwZXHMcHCqWHxg1jySQIL98a9uh6OlpRvN9GXJ
         o2qQ+qsjlwT61WxvX7VxBLzDk98RTRle6nwEF/X/sKI4MYl8BFORRQiVVUkWgX0MUGqa
         sLaA==
X-Gm-Message-State: ANoB5pnRGL1R8Vy8wSDlQBIrfF/bEyQKgfIKcHmABaeu40Buvk0ZeEhO
	1dgwoXzPlhMUMg7FyJO5hGCLCJMlf9+4xIm/j9M=
X-Google-Smtp-Source: AA0mqf5t2EnEEHg3FiYq5ObDCWWH3FWyQ2f6sbmAwIpOq3JsEuJMFGlEqg5Gx/0fUxcJmvofAN9+ffcQTWi3Q6KAwN4=
X-Received: by 2002:a17:906:e246:b0:7aa:ffd0:b738 with SMTP id
 gq6-20020a170906e24600b007aaffd0b738mr6454936ejb.122.1668293866048; Sat, 12
 Nov 2022 14:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20221110150035.2824580-1-adeep@lexina.in> <20221110150035.2824580-2-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-2-adeep@lexina.in>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 12 Nov 2022 23:57:35 +0100
Message-ID: <CAFBinCAQb1BXUp_Tou-UoS5AHFFE76cwv6mynoDUZp0ySwPeeQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: amlogic: mmc: meson-gx: Add core, tx, rx
 eMMC/SD/SDIO phase clock settings from devicetree data
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_145749_559178_6129E1B9 
X-CRM114-Status: UNSURE (   6.86  )
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

On Thu, Nov 10, 2022 at 4:01 PM Vyacheslav Bocharov <adeep@lexina.in> wrote:
>
> The mmc driver has the same phase values for all meson platforms. However,
> some platforms (and even some boards) require different values.
Could you please elaborate which phases are per platform and which are
per board?
In this series you're only managing the core phase differently for all
AXG boards. IMO this can be achieved by extending struct
meson_mmc_data with the desired core clock phase


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
