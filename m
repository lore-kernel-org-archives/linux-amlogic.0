Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4CBC47425
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B2A206FA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngQxurz7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+QSecoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B2A206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AXwiHjhH9s2ltIkTDSZF4S2+99XOd2eUAujYAcXp898=; b=ngQxurz7+myg6Uk5qhjRA+8LD
	s9nDFGUCnY38y5jYJeyq51kJ9M780JoaGwUcaxKrLDMzk5slBEgKQhTrPBjA0QcxngTnjQHK9Ibn+
	HwqbOijnenL8oEiLYfWCgkYskIA0WlxmfXcUmh/bdlRiNt5VW5WoTreC3FbbJR6rZ7mDAyIoO0rkq
	icIA7F/temzJd0mxefjjYeMZD2B3xcdqitNmyi0IWiErXv1EloD9iwZ+4GjMjuMd49QE6UfhGu0fn
	dN5FEek0b4MtzPYjOJtweLVo/v4Hmfq9/moz4J+zu156+GyVPpRpb3u/b8CLQP4GNNN1eA+9q12fn
	vQjpzG8iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOI30-0002Fj-GT; Fri, 02 Oct 2020 10:12:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOI2y-0002Ez-Fk; Fri, 02 Oct 2020 10:12:17 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43ADA2074B;
 Fri,  2 Oct 2020 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601633535;
 bh=YMb+SikBzA0kaz01qg1rFRGqMR34IEZDdELzQnvannc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m+QSecoZOGe8dvzGAzaVLu6djX6wvstSNjTufshrQ7pLbM+zd/i00BMIxk9HtkH36
 4RGMtD5Y9P1GyZIBAMLBkI9wveIJaHkolhG9ddl4D8wp9XAcl991RL+EtWsjr+8KQt
 XTGHujSHsO4T0sIxR14eOk8W/1eFzzgroCv9ipS4=
Received: by mail-ed1-f48.google.com with SMTP id n22so1085101edt.4;
 Fri, 02 Oct 2020 03:12:15 -0700 (PDT)
X-Gm-Message-State: AOAM532nXpDzeSVnue7d5zcgDB+0uEKIiuZJBC3TJX7f9g5mkLeGDPW6
 m5bfgkWHOBHugXF5BL/oiyTVcFTXHUdrV29QBGQ=
X-Google-Smtp-Source: ABdhPJyIAzURzd3Z3ZQc9dk3WngtlZ5byJRK3kR//jIcYN1OLykt0UVP1CzVTSlm3oLD4xmvK0KWSQpcyp1ktS9V6aw=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1552459eds.132.1601633533817; 
 Fri, 02 Oct 2020 03:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
 <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
 <1708987.KbI9FDK2aH@ada>
In-Reply-To: <1708987.KbI9FDK2aH@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:12:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_061216_597658_F1C07E22 
X-CRM114-Status: GOOD (  17.41  )
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
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2 Oct 2020 at 12:07, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> >
> > What warning? Please post them here and in every DTS patch.
>
> ack
>
> > Your schema does not enforce pwmleds node naming (the main node, not
> > children), or at least I could not see it. You change multiple files
> > in your patchset so are you sure that all these are justified by
> > warnings pointed out by schema?
>
> The rename was suggested by Rob [1], and I think you're right, those names are
> not (yet) enforced by schema?  So at least the commit message is misleading
> for now.  I'll have to see if I rather reword or update the schema again.

If schema does not enforce it, then maybe just mention that you align
the children names with schema and pwmleds node to device tree
specification guidelines (node name should be generic, reflecting
function of the device). However in such case changing only pwmleds
node name in DTS (without changing children) would not be justified,
IMHO.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
