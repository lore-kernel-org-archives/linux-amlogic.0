Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688F8C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 19:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215CC206C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 19:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5qBmccE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD9aAYc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 215CC206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9W/x4oQy5qehn6m9PE0QOaySQE1uu7dPdavUXlIyN8=; b=l5qBmccE0ZnFGx
	V2YpqiSw+Lvx2NtXxWT7rm3SGMHTe5uUA6c9d2xADTU+amB19NbedYHXB7kbp+FgOe7zmSzp3e3Za
	Tae9AvPqO2c8WkP2gig/DqClNJLs0XsctSDsDUoWWMSc+MSElyX+iMs2lWBfvbpqb+F2T0Un1gX8M
	clbCO769gCa861CNZdlbB5NU9n1lxV9aoRVEarNbMlEBPmkHr7tN2MWJU84LVCJU93HhG1E7FvjEu
	qj53u6lXOHXkwSplESROEc5iPEcvpgxOK09tdtB7Q4iJgH5Fshw4TGUsuRNxxFDkLdkfwq4aFXMGZ
	KA/GWCs5Lk0roXBUdRWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjqaP-00030A-LG; Wed, 16 Jan 2019 19:10:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjqaM-0002zd-Ar; Wed, 16 Jan 2019 19:10:47 +0000
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82F8920868;
 Wed, 16 Jan 2019 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547665845;
 bh=Ly8oTXf+wW25XTLQh/4VVi0iiDCrw9QU0sqGmXLQHck=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TD9aAYc6ndoChArx2GQZ1BfbOk7c9nRrThJ4AM3D27XL/MQyHI9D/5mOmQqT15ql+
 cIuVG1M9GbsRrrwHssI/bpIVkYnUrdIVN95Z6hdtkcCysl5mD+tqLPSVtLtX0agYfX
 4qdCNlLcHww/8NveIyhmp+9rVeGqyQmSJzcTNYRw=
Received: by mail-qk1-f181.google.com with SMTP id z18so4458658qkj.10;
 Wed, 16 Jan 2019 11:10:45 -0800 (PST)
X-Gm-Message-State: AJcUukdNE5E6Uyb6jGHyXEUdz9I1SZNczRCVKzZ6WD06PK4RG/Qs8bcv
 ih8WJcVIkhZBBrHGNXXRHf5YOLQ4f+9Uy0rAHg==
X-Google-Smtp-Source: ALg8bN4tamKw2hTyuVvxfODr8h3Fkesx6ZuaHOjSxfO2ri6dQ2EN6wh7YDA+jwFGDI4SWaopa4/Plj2nkrHn0C01W30=
X-Received: by 2002:a37:5686:: with SMTP id k128mr7465693qkb.29.1547665844734; 
 Wed, 16 Jan 2019 11:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20190116103632.17754-1-jbrunet@baylibre.com>
In-Reply-To: <20190116103632.17754-1-jbrunet@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Jan 2019 13:10:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJx5_K=HtfE6pjirffFJ8kU8aEq+Etjxip2gFUpFSpCBw@mail.gmail.com>
Message-ID: <CAL_JsqJx5_K=HtfE6pjirffFJ8kU8aEq+Etjxip2gFUpFSpCBw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: reset: meson-axg: fix SPDX license id
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_111046_398009_CB39AE3A 
X-CRM114-Status: GOOD (  12.74  )
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
 Kevin Hilman <khilman@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 16, 2019 at 4:36 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> As reported, the SPDX license id is not placed correctly and the variant
> of the BSD License used should be specified.
>
> Fixes: c16292578ffa ("dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller")
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
>  Sorry for the delay Thomas.
>
>  Regards
>  Jerome
>
>  include/dt-bindings/reset/amlogic,meson-axg-reset.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
