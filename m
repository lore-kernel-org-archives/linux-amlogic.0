Return-Path: <SRS0=c12J=JC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77670C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 20:54:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2591C613B3
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 20:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2591C613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o+uRibXH0r5h/TaLNLDRmWJ4U/ESnxpvAaZSiuyymUU=; b=Bsnc8uxO2AelDBHS/Nznzxblr
	g6w/VY6YvDCGZvu+T30KyrC5w70yBKq1DY7XhEwxZngCX93FVnRrHVMnz47e7dkaZD7NB1xb1B29S
	26bwfEy7Xx1+bFjUbSnWnGE9goUEN4b3EPKiRNEO3IKnbu625/+EgPVUlXrwG/egL6YeI7GIPLHAc
	XGnfjHy1TGvthCUuUpSgwK1dUfzHqUq7e2kIzuBoXYEsRV4epxkXUOhLnTCjJZdpXWtnKk83VEtBR
	B1B69TuVO0uyed4UOC/ymNWEFn+LUZnLmB4Si0dZT5TlSbNAf3wvRjsVxVSlCDM/CAS41/2t8o8va
	r86W/ITcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTWEw-000f56-Bk; Mon, 05 Apr 2021 20:54:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTWEi-000f3p-NK; Mon, 05 Apr 2021 20:54:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id z1so13946508edb.8;
 Mon, 05 Apr 2021 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6LxZVp7twuk1JHL5Xp5YNmNLmYb9qEFDrvk0yyYE9tM=;
 b=izPft1Q8DNWOqGOzh0EVVXbGudTKc/QkFQrq1vaPGy5hlQl1Rg832THF64ekd0mvTW
 34MdJluVwdeY0nK9mBQgLsk3zXZaB99wZJZ8q8jfAwCttRTElIFj00xZOL5Flk/6d77y
 +6lFSY1YrJnsZDgJhyDjwHaRneP1ZAUNpVaGiQodMjnUEWJE0UK9nhfDy/ipxUdJ3Mmb
 ER5YZaLFrwdcRvxTHbB/esi0RqLhtVTKPNyu+GydJWBEBwoP70dEdXyC559whVj5tJ4t
 wIp5ed1FCjSHHbjgppU6kODjFedGbHdB6mwUztVqZb+irWYqKDBwlem5T4tcW3Apb0/5
 8EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6LxZVp7twuk1JHL5Xp5YNmNLmYb9qEFDrvk0yyYE9tM=;
 b=d/Jcv8K16czRZF4mMH+XOuAPg6iQccW24GoTRGivTndFsmA6zlOcedamfz1LCO9ELh
 b3D2MVasPD0f5JC4hRG2PiCMi7nhkF8CEaHWGdcj1fod58w5gerlxt4oRAg2NZ86rQdt
 d6REyg3ONJ9sKjDiMr0R3GuiN8OvaiP2exB8nZKx4XKEZwDf+Ipsai9wJ+U7LdqIOOz4
 ScnitGNctWtd0GQjYD6+/P/EbyJ49UdHZn8Ad9Arq62JiubqRJjJ14D0Cgy42WJk8A8f
 t5Kt291zvY85hsF8+eHuel3pyA3fsVPPvG53bZWXFloilYfvFOvqhRUX1V+FCkrkT/qw
 8M+g==
X-Gm-Message-State: AOAM532kqvzCQatQ68oMv2ISufD/j+I8ihgEFKl5yHxTwrkjRV99e0jX
 5RfgFa0ILLQyV2omOz4V6Bu0EO+xIiTETKcDgmU=
X-Google-Smtp-Source: ABdhPJyN+vM2VPpcIcc/xtuCy7HPRYS7fw/LYDVq5myxQKYyLgsXAxiosFhNwD+Pjccyed4xUIMudTIf2EZntQWJgWo=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr33524220edu.52.1617656054852; 
 Mon, 05 Apr 2021 13:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-2-christianshewitt@gmail.com>
In-Reply-To: <20210329161256.31171-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Apr 2021 22:54:04 +0200
Message-ID: <CAFBinCCpUC4eYa=HdcmxLxfBU=4JRpSzr+qGUZoHQRq+u0Ok5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson: remove extra tab from ODROID
 N2/N2+ ext_mdio node
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_215416_962607_81151CCD 
X-CRM114-Status: UNSURE (   8.49  )
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

On Tue, Mar 30, 2021 at 1:17 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Remove an extra tab from the ext_mdio node in the ODROID N2/N2+ common
> dtsi file.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
