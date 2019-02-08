Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50C7C169C4
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 13:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF2A20857
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 13:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/zFSZwm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G06yJn1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF2A20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2Z75TayYc9wU/3Lx99DrK/TC8pG8ocivW0kq61qenM=; b=X/zFSZwmaK0LY3
	Qf6i6rCWOlpqnT4BRcwniJBwvHTndyd2cVnWEBSlJLPsiPMYTpzXdGdAo/yzoI2YZ2gpcRMlTNqqq
	yEPVEdwIPkXvId1t6f0tz9rzJ5NBrfdnNS3I4kJApAr7AkKp0e+g1iI6D8Gsbk5mG5RKm0ryr27Di
	0H/q5LteAz8ooableer0e8UKBkEhbEf/mYEyNXQ6fVyi/2GiWy4AYscDDwSLJL6dk24uJdtWkJOBW
	3UwQetJRyVBdHnB0c/cfSgZDwbod/DVbQwD/Vg+JiCvIkUuYNE8gEIdh1HddClAqDSUqEdzMAt+Cf
	aPW1jQTBdWGONps2xRvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs6f9-0001TI-4I; Fri, 08 Feb 2019 13:57:51 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs6f5-0001R3-Bi
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 13:57:49 +0000
Received: by mail-lf1-x141.google.com with SMTP id p6so2619367lfc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mW8qhamNDM9m+LnCLsuX8f8uOJ/Eq/Fz3JqxK7IP2ic=;
 b=G06yJn1w71aUJD32fkTiHf0UUBOzIHrE4Gu/+/WzhKBEm5MIWb09azIw7Zdy/iN1tk
 zBFYoveDXJOjICogGlCr+HbM3q7wpwXnP+L5gQ2oR1gtN0O8Oqnvylq3qF0tobHcwIbC
 T4AG4KHCUqFxPIY8zS8wj0fWms5UfH+p1lznjw/cDLfokdJhbdceytR4fwM+IphS/IRN
 1FlKT5WSxi2JntszyTi9JoT9kzybxl0A7864jXXY/8biFhkYygNpnm9jIjtZczKy7iFm
 Xs/1TyF8xbIaHstfJinQQ7h+mwIC1eHlNJSOsYykGqLuDMuwBeyzqEgecUpFMJzFf4Eo
 aynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mW8qhamNDM9m+LnCLsuX8f8uOJ/Eq/Fz3JqxK7IP2ic=;
 b=lKGmu5d8Ie9sZXnxeEm8OekPSUcMKSsSip1msG8lIgC0LLwIw0chDwXFxsZCu3SSQZ
 fgoo1sRP3vHYlwfd53fcGWX3Tjp3OPqQvUZUrGClxsy7zbpO56XKpgFc1JWr0W2Uwq4G
 m8RkAnT3DX7e9eaWZ8gqf+Yffzjw4rjXeOd2HzMK6vG7JeG58Cx8574aJ0b25aOsQ8jS
 bQKk3My6ZyokWYvJ21GgrDiVs8mVmCAciOkES+p5dDj+DGTZ5GbSXsU8mwQwaf1JbktK
 Jlqt9wYw31Srkr1hjsk4w0wZWWlVaqA6NlPJY6gEdFSk9ADG27FRwOYF9Ul9R8BfCjMp
 qJYw==
X-Gm-Message-State: AHQUAuZPNxQALwDEA8Y6OJAfkOc9OZQA5IXWgT8wCIwczeocdkdm5v4X
 uTs95ZFmx3qw9xXn/wBANIxO4NjJG5MXCtB9bfngnYK6
X-Google-Smtp-Source: AHgI3IaxyMA3sZoPmEh2BA6fJPJGU8OCooELrE5wmjrkXcP9D1J4xuzMFvAfh/0v2bGkv4WkIUVxI2WTqgj0nFmrn/c=
X-Received: by 2002:ac2:4219:: with SMTP id y25mr13455801lfh.130.1549634265412; 
 Fri, 08 Feb 2019 05:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20190117102315.1833-1-jbrunet@baylibre.com>
 <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
 <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
In-Reply-To: <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Feb 2019 14:57:33 +0100
Message-ID: <CACRpkdb4105RwXhiyVd1dz5mjYO_u6CxTbCySbqUWBv=yhF1qg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_055747_401771_F40999C0 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 21, 2019 at 4:36 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Mon, 2019-01-21 at 14:53 +0100, Linus Walleij wrote:
> > On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> > > This patchset fixes the initial pinctrl support added for th g12a SoC
> > > family, which is mainly around the register regions claimed by the
> > > driver.
> > >
> > > Linus, would it possible for you to provide a tag with these changes to
> > > Kevin ?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes
> >
> > > ATM, we can only use the devices for which the pinmux is already set by
> > > the bootloader. Enabling the broken pinctrl driver could cause regressions
> > > in kernelCI. Having a tag, would allow us to start using pinctrl on this
> > > SoC in this cycle, w/o regression. It would be nice :)
> >
> > When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
> > or next (v5.1) with these patches?
>
> I was referring to the 5.1 release but it is a good question, I did not really
> think about 5.0.
>
> Those changes are mainly fixes, so guess it could go in the 5.0 but support
> for this SoC is still in its early stages, so either way is fine by me.
>
> Whatever is simpler for you I guess ;)

I already merged it for devel and other stuff on top so it will be for v5.1
as it looks now.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
