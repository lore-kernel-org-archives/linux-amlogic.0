Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ACEC43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61E92077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QkISMwxy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NqY1B5Lj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61E92077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuwfjOPgnOBiXle0nscaPRBnDzhZ0rwhnmJhShb62WY=; b=QkISMwxyGCogoi
	kUqDUcJhA9I4P17PmRnaBs1vvZhQCuVnkUOiBNTl23QeD8BkXfgs7bCmDhmbvsBpOTvry2fnv7Tub
	/lfQCqiEn+Q42uZGHGhGEBfjafSIy90V8T14Sk777AVmTEDP4usdbOzsB8vAY6rZSFR+l3FLzPgrN
	FPwU7f59iiy1w+BlhZ2cORujrxZgjHkLWTeBSk+AI2yx5SKWuNxBn2VAMTEX1puu82zg88pwhITOI
	hF+b4zXbWjvoTVbv/EBDmbnn0DhVkQ4769C9MZp9kCjl+k/k4LHBdBXbMgwAF33rq6W0sSh3PtBor
	zXjRY4dxGm/W7cJ17XVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iell3-0007bD-Iq; Tue, 10 Dec 2019 20:05:21 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielkl-0006C2-0I; Tue, 10 Dec 2019 20:05:04 +0000
Received: by mail-ot1-x343.google.com with SMTP id o9so16675669ote.2;
 Tue, 10 Dec 2019 12:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffu1c8lDFafmMWH7UIK/Jm4IFvQzvK0JEWcwhE/AfdQ=;
 b=NqY1B5LjJU0vM1d4WpeD0ZeoqgIt8hI6csNKV63oMHCy3CIGP/mE+VFXtRsCWysuOH
 cBLhJFhVVWspwhg/0iJ+LYahN59cIYX4PzSNnSoLhTclj18oWAVTNbPbGXKwVUcG1m5b
 vIqO9tIcWm1mHn3TDhenvm/Kb7y5VviWObIh9zOffAVbOM+2BsUKYe/3mp7ItszjjpU7
 4r0dzTo0MHzXV0SdMbgtbegD81UW42uChbRS654dX25anJKmSBszdBRt0XPRpcJGh616
 Zi7BSVuJofr6eR1H3qChHVMLTUpJyFOV8FSWll960WfMQRcJGW+9xU5/6Be4ts7TsrE1
 dVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffu1c8lDFafmMWH7UIK/Jm4IFvQzvK0JEWcwhE/AfdQ=;
 b=pKZsTLx+lpswzJWHMTxc0saNTHUv4vc15/c6tEY5lesCEB5flNGoXTFi/s4OsvGQvu
 /uk57y+JIlmnuGmNsz5uI5JfDjE+fkWr/F7X88vHnEsXmpGRuLrDbTkIYNcRG8dbEp9C
 7DY68ZHYBniYatf5+lHZAjY2v2qOqk7cVu0ga/7uR692ZgXjwmde0rCO8Oq1u6W50Atn
 664TSVPbwtxbk7XjyQ2I+6d1IdbUd8dOW+AglKQQdvsGfSptnJzE+te6Nzij7Gjb6V7F
 tweb/88icHQ4QaiXlJ4ZJnuaiwOqGd29XzHaG1nP7j9qNGFx32S4Ya839ZmFlXLTwDuv
 Hqjg==
X-Gm-Message-State: APjAAAVdJKgMRmXiffATSkI5JcLDhRE6AOizCSBbEqJVs9wVnVdXwtWl
 FDqUD6oGjXliS8a4CVGgMtMv0k63hReXRKv0YQ4=
X-Google-Smtp-Source: APXvYqyQXxbMb0eeNtonRVid5JNsQL8VWcdzxoDr8Caq2Q5ouK3M+5t6gh12myZjJdQRIwE/4kJ8HDen46CJJDc7XCI=
X-Received: by 2002:a05:6830:1b71:: with SMTP id
 d17mr19510797ote.42.1576008301566; 
 Tue, 10 Dec 2019 12:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20191101143126.2549-1-linux.amoon@gmail.com>
 <7hfthtrvvv.fsf@baylibre.com>
 <c89791de-0a46-3ce2-b3e2-3640c364cd0f@baylibre.com>
 <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
 <7hfthsqcap.fsf@baylibre.com>
In-Reply-To: <7hfthsqcap.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Dec 2019 21:04:50 +0100
Message-ID: <CAFBinCBfgxXhPKpBLdoq9AimrpaneYFgzgJoDyC-2xhbHmihpA@mail.gmail.com>
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_120503_068352_60F20AE8 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 7:13 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Hi Neil / Kevin,
> >
> > On Tue, 10 Dec 2019 at 14:13, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 09/12/2019 23:12, Kevin Hilman wrote:
> >> > Anand Moon <linux.amoon@gmail.com> writes:
> >> >
> >> >> Some how this patch got lost, so resend this again.
> >> >>
> >> >> [0] https://patchwork.kernel.org/patch/11136545/
> >> >>
> >> >> This patch enable DVFS on GXBB Odroid C2.
> >> >>
> >> >> DVFS has been tested by running the arm64 cpuburn
> >> >> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> >> >> PM-QA testing
> >> >> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
> >> >>
> >> >> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM
> >> >
> >> > Have you tested with the Harkernel u-boot?
> >> >
> >> > Last I remember, enabling CPUfreq will cause system hangs with the
> >> > Hardkernel u-boot because of improperly enabled frequencies, so I'm not
> >> > terribly inclined to merge this patch.
> >
> > HK u-boot have many issue with loading the kernel, with load address
> > *it's really hard to build the kernel for HK u-boot*,
> > to get the configuration correctly.
> >
> > Well I have tested with mainline u-boot with latest ATF .
> > I would prefer mainline u-boot for all the Amlogic SBC, since
> > they sync with latest driver changes.
>
> Yes, we would all prefer mainline u-boot, but the mainline kernel needs
> to support the vendor u-boot that is shipping with the boards.  So
> until Hardkernel (and other vendors) switch to mainline u-boot we do not
> want to have upstream kernel defaults that will not boot with the vendor
> u-boot.
>
> We can always support these features, but they just cannot be enabled
> by default.
(I don't have an Odroid-C2 but I'm curious)
should Anand submit a patch to mainline u-boot instead? the
&scpi_clocks node could be enabled at runtime by mainline u-boot


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
