Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F317C432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 19:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3E7206D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 19:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ve6f99d0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3E7206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8WtjyLdMjWU7cIXZ/YOHy8XZXiEHYI6XBk7+nOoykE=; b=Ve6f99d0DPBHiR
	CkXkdKk6vYznkIeocakG9do/ZoRsnczPrCl9vkBzqgOTUGFiG6NKc8UWZ83buKjq05MoKG5fixvtj
	D9V0I8Swr9emragDBeDi/vNT/3NwBweI2gZYeKtBlZbl4dvOCRQ9+0xmFh44MroEpVwJnN7gbf2+9
	42hOvE6Fo0bMmcB+suF1SL26Gr4BotOsjrjmWXmCuqmudSaQfgzTToM8tkt+ajSFvbH+3gcn+9SES
	S/6eD2ArkNCt6n/RVgGhFYZJYDuKSR7cudlWsJiwHeKDO6JxbiITkep9kFxqunXSYHNeYwHXC5fP/
	q9FBij5EG2Yf8W0N6eJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXs7p-00066o-E2; Thu, 21 Nov 2019 19:28:21 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXs7m-000660-Hv; Thu, 21 Nov 2019 19:28:19 +0000
Received: by mail-ot1-f66.google.com with SMTP id l14so3977088oti.10;
 Thu, 21 Nov 2019 11:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CHTfKDAdZLhL1Zm6CO6s2kP8nxK/JV3N7UW7tF4nQP4=;
 b=NtJJm3ZWy+UzDnIfTpRXd53uu8RFR/1vedLc7p85yCOXohuMYpOU99bbKU+XjUFgwn
 0BOEcl9WjkIeUY5lO2CYRkm955jVMOwL4pJnSA83JnPeud4f6qKPvrjM4vCQNAJG7iKl
 3sZdSuVF8O7Fq/pb8VoE+OuIDTaUkAhGdUtEpp3Y/YBd8cpyrze4l+FkjhoyzeQIqzLH
 RvYlxHLkX7rkofjC6QTXBlkm9BZlqg/JF61ZdVVdEuRtrXdtHtuiEgbKfi8QvwELdfcz
 bpEJAko7qXJKC0QP/w66jICSFKuCbbzVsQXXpSldIpZrQm4OUu7yuq8/VvjfpPameECX
 C2cw==
X-Gm-Message-State: APjAAAWd7k21CXHjS/lYYulUPiI91PbpCyYJSXy4n6nTKCfIeQzf+bv5
 UulHiJuvgUu0XNwvrsUJvg==
X-Google-Smtp-Source: APXvYqwSY+m1VVKP1lJWWFMDzjmXAD1VirqNMJL368kLdu7zD5Tqa73Qd9dLlvlXyGQDu+Uma4tvig==
X-Received: by 2002:a9d:365:: with SMTP id 92mr8439326otv.9.1574364497464;
 Thu, 21 Nov 2019 11:28:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u204sm1219085oig.35.2019.11.21.11.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 11:28:16 -0800 (PST)
Date: Thu, 21 Nov 2019 13:28:16 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC
 MMC host controller
Message-ID: <20191121192816.GA7377@bogus>
References: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
 <20191117142716.154764-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191117142716.154764-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_112818_587441_F096EB07 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Nov 17, 2019 at 03:27:15PM +0100, Martin Blumenstingl wrote:
> This documents the devicetree bindings for the SDHC MMC host controller
> found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
> bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
> HS200 mode (up to 100MHz clock).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
