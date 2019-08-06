Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CC4C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FB520C01
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Su0IUbHu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvGmKS8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FB520C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlvwEmjU5RFsyJeSCA3Ci4zhrl1ycVqz4DeyfcoOyX4=; b=Su0IUbHu/2LNlo
	dzlDlouYTXNDGt4vtgVv76Aa89gPMT3qgIWl9ceDWmYOg9S0gFje+4bQ1HSIexQIH5dyBt8oL4MOL
	eo6ZC+91hLysSi1eedi9LwptEabkw3sQkOKDC+LAJdypNbrJKmkCJD8KxHdE1cJreJZVtho+zLMVb
	kpBGRaT3TPrXmw8tUfE+aoJVOOtVzBlYCf80UPeoY8LYOXre0UergYfT0zV4VKZgX33y51v7e5rnq
	wGnJzpLOOcGil+HC5jCZ4u4n1jtI7Pqc5qZ5QfcFKqrc1FAfUWlCgJQzH1z44Ylc+hVSggasWjwhp
	namgsRdsDqf7lqSm6+pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv136-0001DY-P1; Tue, 06 Aug 2019 15:06:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv134-0001D9-Or
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 15:06:51 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2795F20C01
 for <linux-amlogic@lists.infradead.org>; Tue,  6 Aug 2019 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565104010;
 bh=dCfRxSTdrclRoNkv/xjg9SIPiioXv6oSzqoCo0lY4ek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bvGmKS8YZFx2xbQ6yNjElusoHrWWihmo2uXcqWIOxQ/Fbh6EDvvgU50p8kPmRc6C+
 w87ziu7Y5PwEKC05DJjMOu0V97RRZ7/ukBF4oHq9BKwU8aP/azRvPZmoYNEHAHTuog
 cBJNr83SNtIwBebWShLxHDJ4Tb6CeEPQ5IUA598c=
Received: by mail-qk1-f172.google.com with SMTP id s145so63134214qke.7
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 08:06:50 -0700 (PDT)
X-Gm-Message-State: APjAAAVwUeeO9jVRn1xb9LVmES8AUSnkVIfwcEEwWNWaMhaMC4mJCLpK
 uUPjaKW7FNX77S+AcrGYdxTHvWF3+niyomTKLQ==
X-Google-Smtp-Source: APXvYqwskMcAR/Gsy/TuAZnM+fL3o5yfNberLPPVu7PiOwhuQEN3u4auDF91Qxvn22wdqNF9i/GNEobuyrXTHoTDJJE=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr3748098qke.223.1565104007836; 
 Tue, 06 Aug 2019 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190806124416.15561-1-narmstrong@baylibre.com>
 <20190806124416.15561-2-narmstrong@baylibre.com>
In-Reply-To: <20190806124416.15561-2-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 09:06:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZoS-nsH56BdcUYe-4sw1=ESZJH_3S2Y0mMwT701wuyw@mail.gmail.com>
Message-ID: <CAL_JsqKZoS-nsH56BdcUYe-4sw1=ESZJH_3S2Y0mMwT701wuyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: amlogic,meson-dw-hdmi:
 convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_080650_831835_3EC8877F 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 6:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Synopsys DW-HDMI specifics over to YAML schemas.
>
> The original example and usage of clock-names uses a reversed "isfr"
> and "iahb" clock-names, the rewritten YAML bindings uses the reversed
> instead of fixing the device trees order.
>
> The #sound-dai-cells optional property has been added to match this node
> as a sound dai.
>
> The port connection table has been dropped in favor of a description
> of each port.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-hdmi.txt         | 119 --------------
>  .../display/amlogic,meson-dw-hdmi.yaml        | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 119 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
