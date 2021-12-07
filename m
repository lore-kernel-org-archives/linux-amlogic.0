Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E05FC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 21:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZcjd4oLdsXX8w9GrQWCm3RzxlfKKzdnXVPDp9JFyUg=; b=JCoGlAumDTGW6L
	SAEr9ekeHW8NkmlPkfM6Wr5FyBPi1d6q45/1jxGoYxQIn2HMCBHZCmCIGLOLmS09HOVpt4iFTCB1g
	4j3InMXStSsxs9GdJvqrt3Io0Y0uR/h1S+Z8Zc63xwbT0kaFo8M1iQjbAXVCB+VqqCuKLL5SazHyT
	BDvXQp8rjtM2TpcSQ9siFj3WHdrFzlrPgXfFDnYnGWXGtf7BjqdHaqGEk8oL6qSwF9LA2YmSmcbpR
	nz4XQ/kdHpth30jwmwWFL7/98IgRIGN15pvETnReR6TXXNvXxc/7MuOgZbzjdFgHs7v7TLRHdVItF
	m8O9a/GNPdqoQ7Ex44cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhw9-00ABvI-8G; Tue, 07 Dec 2021 21:23:45 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhw6-00ABt2-1T; Tue, 07 Dec 2021 21:23:43 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so546163otv.9; 
 Tue, 07 Dec 2021 13:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLQUVhoOIrV+SG+OfV5ZhN+x+ayCKbri/7qd97/xTXE=;
 b=PS1bO+pJNlPyRTxZkSlvQp6djbWvCham6uxGFWH13rFiWiCOxDahTiD9fJlGR/jgKN
 4z1ixZ7Opoabg/6pa5Z3ePDjxfbSpwcq+fPmzLPshd1w5bD4qHYun+jMDcwxfQYOwgTu
 +jXnLE57hym1IGiCR9a7RBiQqH0XBrEkKWEkG9Wxl+fcqzFI7yXfb/7U2RvaqWXsKsD1
 K7qF7CQAV32OQLMMzKcQ75F4C+TQIZAWdkC9hktpVv+0qru5cAFeZ2j7rsAK3r/Q/Nyt
 eLwWJADbEmUBCOPCUOpWwipmsxHMjFGq/e7XGhaTmpeleVLBzKxLfcgbrARJDrHBcM+J
 g/YQ==
X-Gm-Message-State: AOAM533E/vQi6Elc8obxe5b6jq6n/1E9L27hQqLk+ifnJkhjUWl+RhAX
 rq/Jg8hAgNTJhx1VbssYpQ==
X-Google-Smtp-Source: ABdhPJyTL3O6ptXUFAKiAPyylqoTjSIYVcDq6UiJTyxMVOCdO27TZ8dpog3aaOBIPjPhG9TL27sZEQ==
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr37543822otq.216.1638912220695; 
 Tue, 07 Dec 2021 13:23:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay40sm187979oib.1.2021.12.07.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:23:40 -0800 (PST)
Received: (nullmailer pid 856815 invoked by uid 1000);
 Tue, 07 Dec 2021 21:23:39 -0000
Date: Tue, 7 Dec 2021 15:23:39 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Benoit Masson <yahoo@perenite.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 8/9] dt-bindings: arm: amlogic: add H96-Max bindings
Message-ID: <Ya/Q284LTMwVMEbE@robh.at.kernel.org>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-9-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130060523.19161-9-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_132342_151837_5BBA309A 
X-CRM114-Status: UNSURE (   9.17  )
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

On Tue, 30 Nov 2021 06:05:22 +0000, Christian Hewitt wrote:
> Add the board binding for the Haochuangyi H96-Max STB device.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
