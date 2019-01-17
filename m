Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC7BC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 23:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0072E20859
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 23:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OormeM0B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IbTIPOOY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0072E20859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tp2erxEDWD2bUaAPcGmlNX18o5zMDtKIqS3uJBq9/k=; b=OormeM0BUEkWGA
	iHyDvpgcyP0/9Bqj3dQsbkGciEMYfKkQtOXoJAuEcuX6EqiOid/4a1J2qRBtNVEvmjg1gRfKreH3d
	CK3TSQfaEzFgpCGPvd7rzGnd6ejgG9JNjfJY1bimi2V6UnXOiJDPW6bZr6HyiMUTaBF/c2XYqkMlG
	eT/JwpPUIF6zWa6nAcqxo2AmvidssDP0FVlchb+e1zeDEPWrHKhjtVVEHOEopx7AahGXpuPYh7lt7
	hsFujPtpE2Cp/JK4EmcnG52xTLe3enqORCPtRmGHGxk6Gey359cptY6Wa+oJ8Tj2upF/wqtJTSXtJ
	n1/nWTrZFbxdk8JTi+yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkGhV-0007vd-5U; Thu, 17 Jan 2019 23:03:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkGhR-0007vE-Gh
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 23:03:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id b11so2822254wmj.1
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 15:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=U7MCz0bERkjh4Lwv8meusPJ4WPo+0D11n/B6+zeBFlA=;
 b=IbTIPOOY0KpkQPQOdOJzS2KCsYZw4TmRaaEUvweD85OytfsW/Z+AaDlOTMxIxryW6P
 C9i4wLfeBFYU1op9iZSAzTnMYdOxWLNOBZhbyjkw/m/YkS1y+Y0czT1cgGH4a8QO+9rW
 OOAu2hYhJpe73BLt8IHHOSFPP12w/nwi0rb99SCg6FPP+gXPnklnhz2kxq3Nc2tf7swV
 lVKHO0nVxnoJS60fTazZn4DPuNVYdws/GhTzIafoKNw2TE8HL2gl074qKgb0ugix/cpA
 chvnL6OKmrvf8VscqBZHT8MyFjSD0Jptbjw3m4HJu1C/rNBWr6nhW+U38hQ00sdkLvWC
 6lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=U7MCz0bERkjh4Lwv8meusPJ4WPo+0D11n/B6+zeBFlA=;
 b=YAtu8QD7m1OqdCIvYLCeAz12nsdY2P++Y2DoOlxxck/iaueT3kcikE9yVynqgZKErj
 Ey8oNgn/u8gQFeoGjsfB8E2BJ+CkSSIAKB9mePx5VeOVgz7/DG510mxfUu98b2SaLsx8
 Sv51GaLhVU/8ZwcjQF8qfP9jc3LVL2o1rwQRok2it/Lv3QDjXJSsD4BqVU4OysN49aWE
 OHeiwntLUg9/z9vfelyZ4vMd/FQXkhqh9ERUMdYioBIxi+YhrtK/Zp4EVZ1nZlJGkPPx
 CxFHLibqOOHKt6SToxoBq5nAtM09uPOfmkqNECk9AAxPxIrf2WsVkqp815JCsNSwQQhw
 ngKw==
X-Gm-Message-State: AJcUukcIII0C+4+hbfpst6O1RGOtJE1nVfH8/gLwmVGoCgEQ4Qx524ir
 bsAD+NJJjBuPmPD+TY6T9YEckA==
X-Google-Smtp-Source: ALg8bN6J0006KjzbZL63DsJnc9ud/V6ns+nXdC+fHP5NhdpXH4J3JBMlpvDmqfLot60UjjprFR8WNw==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr13922665wma.85.1547766226754; 
 Thu, 17 Jan 2019 15:03:46 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id w16sm88818150wrp.1.2019.01.17.15.03.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 15:03:45 -0800 (PST)
Message-ID: <61b854605207ee30969d25b1e16948e7a84d331a.camel@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 00:03:44 +0100
In-Reply-To: <CAFBinCBSxCMqhF+Tvw3DfBeXQzthT9U+QtWxmPA+1X+SwivFmA@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
 <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
 <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
 <CAFBinCBSxCMqhF+Tvw3DfBeXQzthT9U+QtWxmPA+1X+SwivFmA@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_150349_615090_4B993028 
X-CRM114-Status: GOOD (  27.62  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 23:42 +0100, Martin Blumenstingl wrote:
> On Thu, Jan 17, 2019 at 10:45 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Thu, 2019-01-17 at 22:20 +0100, Martin Blumenstingl wrote:
> > > On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com>
> > > wrote:
> > > > On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > > > > OK, but we had incorrect documentation in the past. did you check
> > > > > this
> > > > > with someone from Amlogic?
> > > > > 
> > > > > I'm curious because there seem to be two different approaches here:
> > > > > 1) hiubus name and offsets are being fixed within this patch
> > > > > 2) aobus is being dropped here and re-introduced with a different
> > > > > name
> > > > > later
> > > > > on
> > > > > 
> > > > 
> > > > because hiu exist and aobus does not, for which both the name and size
> > > > was
> > > > wrong
> > > > 
> > > > > approach 1) can also be used for the "rti" region (at least in my
> > > > > opinion, the patch doesn't explain why it can't be done):
> > > > 
> > > > THe patch remove aobus (instead of fixing name and size) because, of
> > > > the
> > > > multiple region documented covered by this 'made region', I did not
> > > > anticipate
> > > > which one will be required and I did not want to add them all.
> > > > 
> > > > Better to add them as needed, which is want I done for pinctrl as you
> > > > pointed
> > > > out
> > > > 
> > > > > rename "aobus" to "rti" and change the size to either 0x1000 or
> > > > > 0xb000
> > > > > (both values can be found in mesong12a.dtsi from
> > > > > buildroot_openlinux_kernel_4.9_fbdev_20180706)
> > > > 
> > > > RTI is added here:
> > > > https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
> > > > 
> > > > I don't really understand the problem ? result is the same
> > > the actual problem is "me" as I have conflicting information:
> > > - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> > > as the GX SoCs (for which there are public datasheets) - this is how
> > > Jianxin added it to meson-g12a.dtsi originally
> > 
> > And it was the same for the GX family. AOBUS in the DT while there nothing
> > about this in the memory map. Keep wrong patterns does not make them
> > right.
> > 
> > I'm merely reading the memory map here
> can you explain which "memory map" you are reading exactly?
> 
> my source is the "memory map" section in the public S905X and S912
> datasheets:
> - "S912_Datasheet_V0.220170314publicversion-Wesion.pdf" page 48
> - "S905X_Datasheet V0.3 20170314publicversion-Wesion.pdf" page 43

Those section yes

> 
> > > - this patch does it different - but cannot check if this is correct
> > > (no public datasheet is available for G12A or AXG) nor do I have a
> > > "big picture" of upcoming changes
> > 
> > Yes it does it differently. We should have picked up on this a while ago,
> > since gxbb at least, and we did not. There reason to create bus that don't
> > exist in the memory map of any recent SoC.
> in the GXL and GXM datasheets from above there is:
> range: 0xC8100000 - 0xC81FFFFF
> name: RTI

So we apparently agree that aobus does not exist

RTI simply goes fron 0xff800000 - 0xff800fff on the G12a doc, it is as simple
as that - as done in the pinctrl.

> 
> thus in my opinion, based on the two datasheets from above:
> - the bus definition (start, size) in meson-gx.dtsi is fine
> - probably have the wrong name for this bus in meson-gx.dtsi
> - (assuming that GXBB, GXL and GXM are all the same - I only compared
> the last two)

I still dont understand this focus on aobus which simply does not exist in the
map, whether it is by name of size or offset. Same goes cbus and apb.

> 
> > Creating bus should at least require a start and end offset explained
> > somewhere. Copying vendor DT is not enough
> I fully agree on this one!
> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
