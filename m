Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61627C3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 16:16:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34CFB230F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 16:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EmjYoUud";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TClCeVoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34CFB230F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNoLz38Sb3TOuzrLjEXq30ULtIaQqMLPRf1mpD6fPJE=; b=EmjYoUudqvsYCm
	1NkCB5Gd77heovLEV/+ZCTWY2pu0GC34r55Gn9J8C7cEwrcjPthnbscWiXihrnnD14Y85jzXer3mG
	d9Y0b1OH5HnG4Y1xp8iFKRxn5RTXR/oIo7ZM0/GCKELleWks+XUQP6G9BR42ZUjlRDJVduPCGxGV9
	WR6Z4py5PTfJkzxCLuemcD1nzDUjy54w1fCye7qEhUvtQgZ8T67umL6BGJfw0HdJVvC83SeUDYYqP
	Ynqo7+EFtcAZsi40gFrNy4J3HfZr1Y5YoISmAFriu9+pmz362HK9t+ji51qPE/RAFsK6VlC8TUaOn
	G4HFK9MdNao2RoaRAGAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i06o6-0000lE-Fn; Tue, 20 Aug 2019 16:16:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06o3-0000jX-Ns; Tue, 20 Aug 2019 16:16:24 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F8FE230F2;
 Tue, 20 Aug 2019 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566317783;
 bh=bq0/jB5m4Jp2FX8tBxSzWeqfhZTnVq066dgi39PlpzE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TClCeVoX+Lao6744v1UtRF8HhC2UQ2O5TO4HnDMwLhBzXPXaXeg3mhBCGKmLEgQD3
 6PHk/4MEGIVN+wNL1L4SkDQYveyMBVn1UZu/Q3GTwx3vpwjjmAUtB51+m6/ppcbkYa
 F736nAUWf3TfUAuhGN1ohivoz5Kn+FgeyuP5FVg8=
Received: by mail-qt1-f174.google.com with SMTP id i4so6653971qtj.8;
 Tue, 20 Aug 2019 09:16:23 -0700 (PDT)
X-Gm-Message-State: APjAAAX8zBPD0dVPpAZdF6Lh3WuAMMMT7WGHgVKd65Jkm2QO4mdycpcd
 4YAv3JrT9svjAL8R2JfygzZuaH2FeCe5vPwpEQ==
X-Google-Smtp-Source: APXvYqwp9qLnX0fVBz6JKjNTCRZjs4AvNuGh+ir98aRhQvRHBFS366WOun9yixr1j0KWUOR7JkKRSM8t6XOkoOt3MOs=
X-Received: by 2002:ac8:7593:: with SMTP id s19mr26991334qtq.136.1566317782530; 
 Tue, 20 Aug 2019 09:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190820144052.18269-1-narmstrong@baylibre.com>
 <20190820144052.18269-6-narmstrong@baylibre.com>
In-Reply-To: <20190820144052.18269-6-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Aug 2019 11:16:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKAL0UG2afJgOVjtzgDA9oQ35p9ieSYnzys5OPYU-RvmQ@mail.gmail.com>
Message-ID: <CAL_JsqKAL0UG2afJgOVjtzgDA9oQ35p9ieSYnzys5OPYU-RvmQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: arm: amlogic: add SEI Robotics SEI610
 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_091623_797381_3AE3A5A3 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 9:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the compatible for the Amlogic SM1 Based SEI610 board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
