Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C42C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODf6ctbwmEItx528BTis/JR7yUfROgmzBTSE108t7WM=; b=IVTSdHzBIRbXeC
	t+iY/5tq6GOoWvlSuIOwbXo9fMhU3tiOp7IflXOzLmg5tsg9MfceDjSjwfqE4BTjJc6Zny5X28dOj
	3nCV6oVflp/msgYLKAimL5vCMWcjwvwq9QQNQL6QtF3l9bzvzx98JZlWeByRzhCtFdK9qHKplHiwd
	2BcnylUpbooIStR8FYzU1XhMo+qLwiMROyzfGdVwjmMv0as14Eo2tN0DK2RNUEVrE+13JzMrapo5t
	6RAzFGMQtbrZf2P59+rcKIVkOaJ+LYXkLKWYFDsT4rEKw80KlADdDrHE293m+axIGnK+MM5ZcU7qO
	A4EGcaqm9rPIUETNmtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Sqx-000jtt-Sc; Wed, 12 Jan 2022 01:55:07 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Sqg-000jnZ-KD; Wed, 12 Jan 2022 01:54:51 +0000
Received: by mail-oi1-f181.google.com with SMTP id r131so1580138oig.1;
 Tue, 11 Jan 2022 17:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yFu4YXdx41UOd1vz7CJnROycNl0bjAuTCz/ym7j7eQw=;
 b=qF7DDENqlMP22C8j3waGe4CAEK1HN/5F0ktpphMgIjA8VFSGZ3BfZUrde9qThfkw5d
 U2eYEOen6JRFqE3HL1ESOn7ROxIfFQrhlgqWtyO+LNYVmzWxLY0gRJ7fF3XSDI9jQ1ux
 ClwyivkAEMuPbqgjQ748byBHk7yRsWcPFLVIbgcVTLkNx5BY/kyVTOgIwoTcqD6z7XGw
 1Oi8A5SQRmh9czmeF7lFb/Zt8CoOZaWjo1ESMjYSi0iTCL5zKKsyUvymN3NlTAVrJks/
 MrPoR5Tn8uFK87YHZzCZVbVbNjW1jNP1/+Yc+mMwKg0/FCc2aBrbWFBR50cSUxuAdu3W
 K58g==
X-Gm-Message-State: AOAM533+oKz/eAfOb2jbBvahItgaSHa1VoeRW10Sfj8NIl7CHAO7lAfR
 cwglKnXfkQekZGNVICuz3W8S7DUsLQ==
X-Google-Smtp-Source: ABdhPJzgCSk7w9DxNqhAYhWxkv43pujoIQ16tiGZjVM1hq+XIuSE6wC2gLvT4TgIg5bCndUVD3gFQw==
X-Received: by 2002:aca:c104:: with SMTP id r4mr3590467oif.93.1641952488564;
 Tue, 11 Jan 2022 17:54:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bh36sm455059oib.19.2022.01.11.17.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:54:47 -0800 (PST)
Received: (nullmailer pid 3905050 invoked by uid 1000);
 Wed, 12 Jan 2022 01:54:46 -0000
Date: Tue, 11 Jan 2022 19:54:46 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI
 output port
Message-ID: <Yd405jhJtNSiOgzm@robh.at.kernel.org>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107145515.613009-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_175450_691569_6917E2C6 
X-CRM114-Status: UNSURE (   9.69  )
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

On Fri, 07 Jan 2022 15:55:11 +0100, Neil Armstrong wrote:
> Add third port corresponding to the ENCL DPI encoder used to connect
> to DSI or LVDS transceivers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
