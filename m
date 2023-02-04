Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E255C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 23:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoN1zAZ+2XrZ2VEjknkkx7lLfO3LmXHrEpWqCu4CXOo=; b=r7n9LgI6ZKrHZz
	lrOfPApMLOMQUgedlwNmZCptrEJ486EIw+sgpbKH8/2N4yQhzW1vQvZ37yMgVHa8FKncEAFHvhSWL
	g+lkmNF4eaYRTRO/OnYl1an6Jfrn+Xt3VDnwIeh+IV/ofsSMheiQMnms0FC7YdnlKZfacn/k6Zecn
	H0NwCE6Po2UokuLNWzGHc1sOQslPcgppwwnCQjiX36muEETBfV/5RMotJvlPNTt3o4dqadRI97K2D
	bJXK0kSE0XNClBtQlsD8v8n54tm1TvDhNZgoQ65Pz1W/hgzUKxEmnJdOdIfCejBlK9BTQ+vgtWTI8
	y7ENQD6en6Y5fOpVczow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORbr-005fYM-4U; Sat, 04 Feb 2023 23:06:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORbg-005fWI-Hz; Sat, 04 Feb 2023 23:06:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id u21so8399670edv.3;
        Sat, 04 Feb 2023 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsffKkQbD1Qv01ydUNK4favIJJi7ReNERIe710JhOLc=;
        b=QX1kKPY2S9den3sFFq9zBF6oaoNhXwtsiXVec6pyWYmj5eaQemIMz1mM+QULn39HDz
         dYBNcKmZIKouYOSXeXneMDWL8gaAoIIV+VOMaKVmvq8YO+SRxuLpj5I2OliK4gd8rMsz
         zKgzAPPtIqnyTpLmWZiGNQNDFPuCvJMRMN9m8t3U0mACWmDd66k3QV6PldYWHfWjhVpG
         d2NiJ2UGwHnHLoYNJ/nHQuiuHQb9Mj1cIuMBuIZj5rro9C89naZqXZPVJ/9uNmhsQYKY
         IParG5s9MhY67K+abbJILJN4d2HL8Zsv+4b74cX9aFtvzdrc0QAt8JF5l9byhuchfaMg
         5L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsffKkQbD1Qv01ydUNK4favIJJi7ReNERIe710JhOLc=;
        b=L/lX0dBp2NRDAx9mPVVxqP/eGSlCvxPG/l2OxUk1NGAWrmfx9+uHCidSknJp9dIDeA
         2jGVi9TG+E2tDJErKLF6PKbAVi57WGjjUcv2M6hEYqCttB8NU8Yr4QqK65pGeNSZr+NH
         Lld+DC8TI79IBtvv7VuyohIyzh0JBYudgLBPyMyQV4sRz47wxlNQDHVoaNwnk1X6wLvJ
         gfCnIVCDx6Zh7fDsVDr5xuiLFU6s9rt8WXlPj5tj+1aWDi8TAd3h8PQDSvz5EeZsr5qJ
         +nlKm9ZO2Bf0nmjHEOUqX/iGN6Ctk04s2tKwI0OHZjrG0WCmIyEOz46wtQYQUsPzlbHI
         +V2A==
X-Gm-Message-State: AO0yUKVnUWiaiU00WgzeyV9r1NvzC/7mtLNGf+grnwArAxyY0LvJLDuS
	mPuk9Aw2vNfH56MMvPJs4jNojR/1DUziPKkFxWoq4RSwYE8=
X-Google-Smtp-Source: AK7set8QzdCT6rdHSN26GRk6gqcqpBSqwKuLjmP897qShiN/tHqfvEeG/Nr2ga8bMvWh7H7Y/+Kp68maCVfvhkCUaRE=
X-Received: by 2002:a05:6402:1110:b0:48e:b978:cf63 with SMTP id
 u16-20020a056402111000b0048eb978cf63mr3883209edv.57.1675551957173; Sat, 04
 Feb 2023 15:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
In-Reply-To: <20230202141520.40003-1-avromanov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Feb 2023 00:05:46 +0100
Message-ID: <CAFBinCC7=QR3Dd_N8VN-L7CpFWETTTehNo6j54f9Y53w8emwUQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_150604_617148_55C83752 
X-CRM114-Status: UNSURE (   7.10  )
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

Hi Alexey,

On Thu, Feb 2, 2023 at 3:15 PM Alexey Romanov <avromanov@sberdevices.ru> wrote:
>
> Add gpio interrupt controller node.
>
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
I have no way to verify the register offset or interrupt numbers.
Overall it looks good though, so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
