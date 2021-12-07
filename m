Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4EBC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYA1A1ywFJtLSGl6UYoG/qRN5D4roiGAwloGV0C4nHU=; b=hd6m3hEx144W+H
	QJ6fR+4gu0aeONP2frflODXeAocEbXL0DmSQa7AfwvbPxZPihe94i3E2vY3M5Pl5rPJGRGmc1Mdq0
	jn0Yx4MjSHbbSmTgHOh5HRt1qO/c5S/r5NK5bnyyGIBQb/YEELMNh4T56LhQflZY6dvZ/xVtH8DgE
	sLDHrFiC9agD5NPiV8gCKJOgz5MbR40Z/fy1Ru9HTk41TatCfMzb2chxCNoSxIkAxYWd6DCrsg7RI
	PV0r7+UW7CIzAYK2lWSyO0yRy2gzRjNB/IXWeQqAAJfxsnH7eSYBeaUDpqZHfP5GCPLaSWU1HUay0
	XIO1LrOLWDv4qM7kjTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhvX-00ABe8-Ez; Tue, 07 Dec 2021 21:23:07 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhvJ-00ABZl-VV; Tue, 07 Dec 2021 21:22:55 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so576143otg.4; 
 Tue, 07 Dec 2021 13:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ig7DUIaTINk89eTPOp4alctzbQOuy3NjV8hk+IyDqn8=;
 b=uGTk59f+PKhyn0jszFrVnkuAYI4LFJIC1Nb6qnwOWpA3hkeQEOqTFipYYAKHLqA8/0
 q2yaBpouebnd9NFPT3OlwxQKD/uD5Cts745Bum01YwAv1ZJOMFpZYQLZWowPWj9ufvTZ
 qBctbeY4W58YFNiqEkEKLSM/8P/Ac9gGNySs2hCSPOPySq77MKxXi4YK/X8CdzjTf93z
 rQcbuimSsZph8K3IF8+e3HUnwg9uZsuOSeZHyWOYXW5sJ9yrmaC7kWI0F9mA80QW+Qix
 J6Ll7+tVugXB4W1USd5kwCOiHc72OaWufmZVBpDRlCj2PdXm+Z1dJut1bRNBdbtkt1rS
 BwPg==
X-Gm-Message-State: AOAM531pLL+QGeD1Dlrh5D7c+JoFytifiapxN3tvoUrfqKXp/BP0ueLP
 L4KnwxIPLKZk5xVh4Qfung==
X-Google-Smtp-Source: ABdhPJx76bE8mVonnxBVtIQzngpSCx5r9LEsv901SZLPWCMQldOXj6xp0hpBWlZgjdPfueRKtuoJ1g==
X-Received: by 2002:a05:6830:2b20:: with SMTP id
 l32mr20158035otv.333.1638912172543; 
 Tue, 07 Dec 2021 13:22:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l24sm160140oou.20.2021.12.07.13.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:22:51 -0800 (PST)
Received: (nullmailer pid 855332 invoked by uid 1000);
 Tue, 07 Dec 2021 21:22:50 -0000
Date: Tue, 7 Dec 2021 15:22:50 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>,
 Benoit Masson <yahoo@perenite.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [RFC PATCH 4/9] dt-bindings: vendor-prefixes: add cyx prefix
Message-ID: <Ya/Qqql7x/LQPfsQ@robh.at.kernel.org>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-5-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130060523.19161-5-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_132254_037187_4C09C89D 
X-CRM114-Status: UNSURE (   9.21  )
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

On Tue, 30 Nov 2021 06:05:18 +0000, Christian Hewitt wrote:
> Shenzhen CYX Industrial Co., Ltd are a manufacturer of Android
> Set-Top Box devices.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
