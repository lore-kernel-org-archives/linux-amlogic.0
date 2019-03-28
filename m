Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3E9C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BD62173C
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9VvyfOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BD62173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXyaE9G7MKZwPWlwoF5FlixlZ6lFMcLv5euFkmEIAIQ=; b=q9VvyfOEcFd2U8
	XOXygFXXsAR6E3Cka/JbbNoS06IQJy2DfK3ztxyrmmz4zf84JHblvdh3EHhV/2cjnm/Ye0vZ3ApUQ
	xXeCU19PB6dqswtFV/e1VFNu642Q35YwK6N6ZCdjCFN6/vLR4ZtWvzKZc7ClEhxHTXHvAAnyKmoYS
	9T2Zq9s5bkVax/TzpHn4uoBBDb0Wqey52qdWcbQa7izY6wQTwjfuwzsukOSYAamXZjgnszUAxeQDP
	+EP8R1SM8wGwdF3dQAlcta0N0RFTR/KEC+o52zAZGawQ6hP6wTJ7gBW3VgOp/LKHAE9zfv4OXobWP
	Tj63pb1IUejXC7KRTi4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Wmd-0008Lu-W7; Thu, 28 Mar 2019 15:17:35 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Wmb-0008LQ-2L; Thu, 28 Mar 2019 15:17:34 +0000
Received: by mail-ot1-f66.google.com with SMTP id k21so17305085otf.1;
 Thu, 28 Mar 2019 08:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OS6pHgTLBklX9XKfAD0SUoPMglmUTPXYkJTZZLPv0Rg=;
 b=RiBRmktsSyagO6V+TuCzrpEGemoQEljs++Qj4QMwNUi8R7cugoqoF2kjSztB21PFe3
 MajcT8CR7osqdNeS4J7xcwJ+vmC7LbkpUuRPyuGCwEsbfYIV+effEeozCl36P54s+u+Y
 Sjpki03VKn+TR+d479bOeGZn8ILzNtZEM+ZvSpnBI7/Yd34JAgHmEP+Ke9M0LWrQdWEn
 OsIq3BKFLjT7BpHrOakRPVJqWobQB9OsQ41m3qjjsW70AOiik+tCdRqxmlqiQLpiMU9Y
 JOed1sfYpbqf11/D5fR30lcvWFmIz7k/zJHjF/5k8VVYKHzE/4ohOP549oH6pHKPoK3C
 zFaw==
X-Gm-Message-State: APjAAAXMRaNnyBVLUan+4OHbQreNsD1sT3Ej/uOJXtZyGBlnqIPz7rvY
 3EXDPc2P6IX5IqwJtXFCoQ==
X-Google-Smtp-Source: APXvYqz6CO9Z49GS6bebLHKeOspUAbs9CyLMtEZ4rG9Z0A12FunJginBtlTCujm5v4lz1c0E8GHLww==
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr29381833otk.329.1553786252045; 
 Thu, 28 Mar 2019 08:17:32 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z2sm10840270ota.56.2019.03.28.08.17.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 08:17:31 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:17:30 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: amlogic,  meson-vpu: Add G12A
 compatible and ports
Message-ID: <20190328151730.GA20801@bogus>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <20190313141030.5958-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313141030.5958-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_081733_141744_14C01939 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 13 Mar 2019 15:10:28 +0100, Neil Armstrong wrote:
> The Amlogic G12A VPU is very similar to the Amlogic GXM VPU but with :
> - an enhanced plane blender, with up to 3 OSD planes
> - support for AFBC 1.2 decoder (for Bifrost GPU)
> - support display mode up to 4k60@75Hz
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
