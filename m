Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A999AC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 19:16:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B9064D87
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 19:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B9064D87
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6UPmM5P4xLwiTiKVK1fwskX3qSTNgBGYjWQ6BD2kFUQ=; b=Dg0kfAeG23rLnkSSxFjONqP1G
	ywDYwvzDJbDaW5mbcFRE3UywdkplM2q/nIMRGi7a+A/Z80Bv+1/zQZJWXJg8RGSULzT/+o3rsAXI9
	dOPkyfhSmM8I3AYLNB2yo/MItM/q3J5ue7ePluMaoVjjMBWpU93vcUfiLJaAAV3dKWPdX4aZAhwyW
	n1twdCiTSwi8xnOirl7y8AafD0OZ7sATZ99IcwyuTdMTnzMrK/2unIFJQELOqDrsVsYBqVSfWQ8/n
	D/fVDV9Xn1zGpm4teMffXkbEpNWCv0Asfa/hl3ahq4C7Rcfh4sZqLwk3pI90smZqYQOBvjxrP13EG
	GQ4CHnkDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l71AO-0002QK-B2; Tue, 02 Feb 2021 19:16:48 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l71AL-0002Pa-J1; Tue, 02 Feb 2021 19:16:46 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DVZLL5V8LzQlZD;
 Tue,  2 Feb 2021 20:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1612293397; bh=j5o4g5IgR5
 bogQDxz/xO2FW94e0Zmzci3W+4QYAWG/4=; b=ntne0RMxxcleZPvRv+JNWBQmHP
 mI8zHFl+/nvUJlj7Ro7OBqo+cOyttbLogkg6gU7M7Uop1/U/D+Yg+1Mg5SlEoCEC
 p+ze7eOrahHUGFnrDwX7+DDbMSkltVgSlrusF9eHVFw9a41nW9ZGLGdyrlq6SWq1
 aujmnFEx3BFh+eB3ka2T/rAngXVmx9FTIrqsax7x6i2KraJH1IZC7+nwRxIn/Ljx
 yU+AsEzHZz44wNw+5G0UXBybLmS73J3DMVII06Im+lXaf0WF/oSxZguX5yosF+u0
 0/magbd7vqEYwN53JvQlmNUS+8nwru+uTDDGAfGG0wM2LI0khjp3Jl47xIRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612293398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLMdFWiF13BPV8bIu9fLvw1Ac9+BtdWUE1eYsk4p6j4=;
 b=Zl75wn5XbfiJAI4qSGgbKu1GDE8HaQ5HA+JjalyRSWi3rLqOZ9cuS8aR7CNc3+UglbozPX
 po6qTF+GNM4JZ+9BZEji0gVIF1wyB8EWfZ+nFNn9OFQc33BguzogZxDEX1z1lKuwoNhACg
 Tz2OhzfHReibd/dLOffAxwwBrGFbWHXPvA7CSq1AjULiYQ3axR+OzvPlaFhwRSv4PjANHj
 DdY0ruKaFAH15t1ZKDhiG2e4NNTzKkpKmqTbwQaHePxWnlfoxmLQWW2350PRYF29sYe7dr
 JVzzTTnidYRXt424cF36qoAwAPPijM8psXgaqzg4Rhh5w7UbioijVmYB4iCg6g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id K_NZxzID2G8p; Tue,  2 Feb 2021 20:16:37 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Add I2C RTC
 device node
Date: Tue, 02 Feb 2021 20:16:35 +0100
Message-ID: <5974424.6LiauEnjn7@kongar>
In-Reply-To: <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
References: <20210202170846.81685-1-alexander.stein@mailbox.org>
 <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.14 / 15.00 / 15.00
X-Rspamd-Queue-Id: 7BFB917E6
X-Rspamd-UID: 2bbc93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_141646_012280_08907439 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

 On Tuesday, February 2, 2021, 6:29:48 PM CET Neil Armstrong wrote:
> Hi,
> =

> On 02/02/2021 18:08, Alexander Stein wrote:
> > This is taken from the downstream kernel and works out of the box.
> =

> Please keep authorship of the downstream commit.

Sure, will do.

> > +&i2c3 {
> > +	status =3D "okay";
> > +	pinctrl-0 =3D <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +	pinctrl-names =3D "default";
> > +
> > +	rtc: rtc@51 {
> > +		compatible =3D "nxp,pcf8563";
> > +		reg =3D <0x51>;
> =

> Interrupt line is missing, Anand added:
> +=BB       =BB       /*=B7RTC=B7INT=B7*/
> +=BB       =BB       interrupts=B7=3D=B7<GPIOAO_7=B7IRQ_TYPE_LEVEL_LOW>;
> +=BB       =BB       interrupt-parent=B7=3D=B7<&gpio_intc>;
> =

> > +		wakeup-source;
> > +	};
> > +};

Eh, where did you get that? I'm talking about this commit https://github.co=
m/
hardkernel/linux/commit/b2e22de15e55bb070a2fd45150a6d3e0179ed0e6

There is no interrupt line, although I understand it's missing.

Best regards,
Alexander





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
