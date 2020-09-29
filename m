Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC9EC47420
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 20:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AE620774
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 20:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQ9VQB4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AE620774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6enHZTjMByysReiRTZIS6PFrfhHTKqnze5aEZQm1xcU=; b=nQ9VQB4au+TMZm6ihiKj4YeDh
	fv0ZGfln4GNy1fP4Tqai1/L13eoumvQovYH5JCaXLPX2kdhTAx8nprEcvUyY/OmgpZSMoldj3wtIZ
	R1ZSRxMoi8TA4Acl0avva5eBXJc2ZtpwcyhFZ+EgS5/mxL63JvIVsSDue+4FNZetMrOYevM6wAJn7
	5+wSMkk4HJ7K709M1hy1/qeUoNlaSIawR9ucA/JVBpq8YisEtlYkIAEceRf9Ai3+F/OrdpLizw541
	+xdMwhB8ySVVkV7nvErayticOLtdEf9/kgU5y369zNNdBLf7vU+91+GRhlrTOxXlP3Nyz32B42t26
	t/yl9jDTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNLwU-0004Ea-Ab; Tue, 29 Sep 2020 20:09:42 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNLwP-0004De-RY; Tue, 29 Sep 2020 20:09:38 +0000
Received: by mail-ot1-f67.google.com with SMTP id a2so5694801otr.11;
 Tue, 29 Sep 2020 13:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X9aOhCfi/B0xKU7dFMYaHxapvSEYg4wg92gtMCjdiuc=;
 b=kJzFlc/XvmBJ1up/wMxUvrPFQglHoa6RlZjQ5KL1uLsON/fDEp5DXfGTKnR7YG2X3l
 EzjvhGnYf9ZlEBS9nxGZ0rceCEY9iJlofyScSklpmylMphsNjtuu22I+GzG5NbD6Bun8
 I6sUzmEPoKChLQ8yWLYYvtW0V0aQvxu0MWSWvq5BMNCQ2/5KzxvWfj4HR+EzZppYxV91
 Ha6adOWvoh4b+tD4FicB3uk1DYLAES9f840cLdPOYbGQz+fcVDmyZ54ihRNP/cslHuqk
 oI2VKzkf3QBYhjFz+QX2ACjbGEGVUsSnyV56zD9uNnDkofMhfVguAcQz0C0RLFrpQ1qz
 hHHg==
X-Gm-Message-State: AOAM533Gj+mSiSp8kwieivdANgecM8DMfCRcIqCbE2Qm0qnDmd9aZTey
 1/fhW7YEhwEQVMVnFhwFuQ==
X-Google-Smtp-Source: ABdhPJzp8TFuyuQd5hO7MbiTMambrzGZvIEVSIVQ3GM76JDqG28K8jX4ZtTpslQS3ksa/Cw6876jxA==
X-Received: by 2002:a9d:50a:: with SMTP id 10mr3786384otw.207.1601410177211;
 Tue, 29 Sep 2020 13:09:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q81sm1225520oia.46.2020.09.29.13.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 13:09:36 -0700 (PDT)
Received: (nullmailer pid 1080265 invoked by uid 1000);
 Tue, 29 Sep 2020 20:09:35 -0000
Date: Tue, 29 Sep 2020 15:09:35 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for the Amlogic
 GE2D Accelerator Unit
Message-ID: <20200929200935.GA1078747@bogus>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
 <20200928161411.323581-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928161411.323581-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_160937_909019_48FBCF40 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 hverkuil-cisco@xs4all.nl, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 18:14:08 +0200, Neil Armstrong wrote:
> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
> 
> This adds the bindings for the GE2D version found in the AXG SoCs Family.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,axg-ge2d.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
