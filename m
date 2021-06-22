Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D013C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 17:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FB660FE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 17:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FB660FE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQHWyDhrMsOtA8xxwkqhHKnERcvDEPdqkg2jCSV8Ujk=; b=YD58CB/MNZ/svd
	xen6KdEPmv109ZxbzGs8eZCjwzNvQljVKmFf9MybgZ3cDt5YfmnzLoviT6+rK4QUI3xhfMJX8eOQU
	e3Mbw9ZK2of2BfJ19+VnVKIezqXrzai/4Mp8H+VsIXtqAKfHW1DYtrHMrHk6nsqGlNnbie1VISz2o
	L2T9tU5R6AIVspMCtjacEJ5tKPP1+UO4FH0+FuuzxtmPvJflmr3zSTFJTpPtdU4NRcqmLze8aqpzL
	Nh7md0beq8/FOHwCY8X3DyLzKRuypJDLy9gxFggSfnAhy3Uxm2sA0vJ0d4gNrIh4Qdoz6xISna/ig
	WrAOgxSCuRcAWFI5kHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvjle-007zGk-A2; Tue, 22 Jun 2021 17:00:54 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvjlR-007zEg-La; Tue, 22 Jun 2021 17:00:43 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so21892843oti.2; 
 Tue, 22 Jun 2021 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CU73LRTmqsTJXC4hCPE4/i0AAwdr3FZJs+LzvR2IcQI=;
 b=JTfsR1QOxSzlj2vxLZxvTeR8R5YGWW3UbyZl8oBQYsB4CnGDqMUmttCi1cA3uLODi0
 hkr+ZxmFRcbPXJRyrW+vzjz1HwVRBHabLWiU38taHodnC0+cnmc3xyht3tt9KH0EalnN
 DyiOe7fQ9u5enXuTprYZcSjW/2Tua3TInECPkJZgtLMnrWUG0UoLqGxuICsn+ZhzAVXM
 oNqGrxVngIXiktfMWDUn1pkKdwBJYgSok9U2ZwmZ0nzhOmufFksClgO6DKhgd/nws4/P
 RJu/0vB+Svoau3mbXd7wuDo1OzO1FLR7j8q6fQ3s3A5Xm4hbYApg8bruOUgwTUifLUuT
 LBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=CU73LRTmqsTJXC4hCPE4/i0AAwdr3FZJs+LzvR2IcQI=;
 b=c94umedy9auJkQ7ibgfOqtPHjyqZXGQC8Dwh2X5mP/HJsdAwWsyLLmCCulDm8J/DUd
 +Lpq3sb5TJT+qxHR5j6U1EoCSXSd/YL+C855w7Y6Z7gYrIA6IlYuRO8IUPloR2VmL2W5
 ay8YCeXHJPwrTf8UA8muSknc0QpywlRVZKlqdpZA9LTbyheGLGWodVu1iRhbjU/3UufE
 c87gjh5JcCOgbLgQwX2CPUFglcr8jShjIrJbq5xRhfG3GPtzEP6m9NbGi0jDw2qYXmEm
 CmsFR/h4MnY2j5xmUs+HhCxEz77rJaHY57NJedYj2DLWtv+w9HJRLSmvTi1aqvAbau2J
 7dkA==
X-Gm-Message-State: AOAM530NNzSJ6nTWWxG5fgrKFW2zF8BX+2Uz+VH6CraxtVA8nAxQyy5T
 JGjVciwVfTGul1+I4JVYtkk=
X-Google-Smtp-Source: ABdhPJxoRFAitm/89S9nKTw10yYqZzZlkwIjYq9UXK9WgXuoqd3GuEH7Q8tIHD2Q6N3/SFxKZJ/WVw==
X-Received: by 2002:a9d:2c67:: with SMTP id f94mr3993356otb.353.1624381239886; 
 Tue, 22 Jun 2021 10:00:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s123sm599767oos.12.2021.06.22.10.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 10:00:39 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:00:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Art Nikpal <email2tema@gmail.com>, wim@linux-watchdog.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
Message-ID: <20210622170037.GA3440464@roeck-us.net>
References: <20210622095639.1280774-1-art@khadas.com>
 <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
 <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
 <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_100041_773408_72D79494 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Jun 22, 2021 at 02:43:45PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 22/06/2021 13:53, Art Nikpal wrote:
> >> Neil
> >> Can you split the patch in 4 distinct changes ?
> > 
> > yes  no problem i can try to do it tomorrow !
> > maybe somebody have other ideas, suggestion, comments ...
> 
> The changeset is clean, and overall I'm ok with the changes, but I'm pretty sure the wdt maintainers
> will prefer separate changes in order to comment of each.

Correct. As per guidelines, "one logical change per patch".

Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
