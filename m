Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED03C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 17:20:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F0D2070B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 17:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaQptDjo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQbXxP/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F0D2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kFWF7bXO1vPev2OzbjX4uMmouGXSGXaU6vgqXr3THg=; b=VaQptDjoBHjqAQ
	khzK1TaGEU20n8GtpbCF8i5G6yKYsjFxI57o5Pi+K8mgpSb8JZM/7cVUtMYesM9jFTuqgLat9iqiU
	vYVx6TxzF6wAIAGO5J7//7MjYJhP37YYhcjV/VhzPMa4/idw5GCHd+0ihOHBbGHq/pnzE01pkZ+Wl
	2D6QNSzIvvFeOBSg+4oDY8i5+4Ag2hgUCmiTuDYVzpAEwsKNpHlVGZGxW1/d97u2C2u/Q6ve9AAWu
	DjJa8nwT4EZY3pDdZRDgAdWbq64XKSDHLP821i3AgGWwK13ODVly/0wV2IVHmgLJRWcvZw2yXK6rd
	7wWwPBn1+OiRMYM8s8Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj5uQ-0006eM-EL; Mon, 14 Jan 2019 17:20:22 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj5uD-0005uJ-6c; Mon, 14 Jan 2019 17:20:12 +0000
Received: by mail-ot1-x341.google.com with SMTP id n8so19997146otl.6;
 Mon, 14 Jan 2019 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qK64DEpMDtPL6DsRftl0nkP0RuweFemsjoRp4cOo2/c=;
 b=QQbXxP/cR5m6Woo2XRdrlrzYxgV1I1QcnneJYERs7HuE0uO51Qrgz+pqVnMj1bJ6zY
 +4KDjWFjOzhDBXx9254MlDDRgCZg5cCqcA09wPkdqa3zXiNVw/8hcSFhpJaxka7ayQQp
 /E91TykuUTkFycBS8Mc0ZVENECk6JQxCiA2exphOUJeEQzC8/tZNyCJEZBc2ibF1x00k
 7V9QJQS18iAG/cGY/6ybgrgj7CQD/UCzWS6Pu/c9Jyvrms2EJJckwlErShvku8hGnY9P
 /R3XnWP3srCd2y3uqI8VBqCAKVJbxnIsRdyuV6hoxhUKBRDxHHre9sAvPYrwkmz/B+AO
 LZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qK64DEpMDtPL6DsRftl0nkP0RuweFemsjoRp4cOo2/c=;
 b=Xc9mAylUJKHI4rGOokMR+PupZlnxmRmXbbWVmD5LGNCdZ7QsODBN4uBagxQ8zs5gW0
 gFtIxccBZlrNUjB8Y874NfeXijnuDyNZWVOvRfDg3gXFcwlRXQaN94CqshvQCXePnWKM
 kRVngA0G0bNNKDhs0EoPi7ZuIWq2rY6818PXlCDk1gEI0SwrVsPLcphBhg1pwQlXFCZV
 QFfAwP1333YM5w8C8JpTSAIt3xmLRoDgqYZwchknMWVkVnTZSIgYieCGCsQIsuTryrV9
 iQ6+T55+zHbNhy9eXm6kuq94p91vLmmQ86K6GnwNZ/0RQuoI5GSmstNO05Rfk+INuXR1
 HHSQ==
X-Gm-Message-State: AJcUukeobcDMIZVSN4G1nqo0uDHQ8k8oh9WGuzmuk1z37j5YqdbXM7Hh
 WjVJI7ZMe1QOpdHkbezu00RYvJPexleqniVfulo=
X-Google-Smtp-Source: ALg8bN59ta+yDTeU5iEvt253YnBqjgkeS9x4IGTKB1CGifNHyHb0yIHt/nx0O6RM4nnwbXtZ9a5RPVW4FYfMkYpn2V4=
X-Received: by 2002:a9d:6297:: with SMTP id x23mr16290616otk.63.1547486406357; 
 Mon, 14 Jan 2019 09:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20190113153022.5040-1-linux.amoon@gmail.com>
 <20190113153022.5040-2-linux.amoon@gmail.com>
 <7hy37nky4v.fsf@baylibre.com>
In-Reply-To: <7hy37nky4v.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 14 Jan 2019 22:49:54 +0530
Message-ID: <CANAwSgQS0B4Gbbvgu2N4cawmXMGWG1Sm0TOg0hTBr2nLteKQxQ@mail.gmail.com>
Subject: Re: [PatchV2 2/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset
 warning
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_092009_330204_D7573B10 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin / Neil

On Mon, 14 Jan 2019 at 21:52, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Anand,
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Add missing vin-supply node 5.0V regulator setting to power
> > to usb ports, changes help fix the usb reset warning.
> >
> > [  795.380156] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  798.356073] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  801.331999] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  804.307919] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  807.283844] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> >
> > Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
> > Tested-by: Kevin Hilman <khilman@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Rebased on Kevin's amlogic/v5.0/fixes branch
> > Changes from patch v1 [0] https://lore.kernel.org/patchwork/patch/1031243/
> > - Split the patch into two part: new patch
> > - Fix the commit message
> > - Added Tested by Kevin Hilman
>
> Queued as fixes for v5.0-rc (branch: v5.0/fixes) with Neil's reviewed-by tags.
>
> Thanks for breaking up into two patches, and as Neil said, please add a
> cover letter to multi-patch series in the future.
>
> Thanks,
>
> Kevin

Ok will follow the protocol next time I send some patches.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
