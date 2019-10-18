Return-Path: <SRS0=E9O4=YL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872CBCA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 18:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFBB20640
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 18:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ht3L9F71";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AUDeot5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFBB20640
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLk+Mml8CaWN+5pjpsVoX/QEUUWHw7TpyLeAmCKPUVc=; b=Ht3L9F71L9Qswk
	h9lN/ND7X15syqsMoW+gAvadfWMn0cBtWHOUp43Pmk0s+T4diJx4AdhwY9gIBn09ze/ZcJesGl5sD
	IjV9j2qTU5KFrDV5ZdsatrywFkB4KOAjOZ3WTf1n9ucAPpngpA14uFlPZn7yl19ZcdNIZU2zly74p
	pVjWxZUyoriDPuxJG/4sLPITXxU32nkOX/Sv/2/Z2RFmd6HqHgkD1s5XN+pGNMjpViKoLMiDSE+3p
	n0g1oqIEqLT3dmirKOTQhJzTjBA+KfU72uqrO6wv2pZ+ZR9Rz4+NEUmqFnNleq8Wrv+90mGzoi6GT
	qTnqDTM1uZK/zvDXmU0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLWjX-0004yi-1V; Fri, 18 Oct 2019 18:12:15 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLWiG-0003lz-Op; Fri, 18 Oct 2019 18:10:58 +0000
Received: by mail-oi1-x241.google.com with SMTP id t84so5943228oih.10;
 Fri, 18 Oct 2019 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWo85hzC3rFDGBh+qfuz6zjPF4f2jpRFQQPWDuhwYqs=;
 b=AUDeot5sdk8RXpqa2rRBSsuSmgFYWqs4lpAV51+6KaztZ2cT8TxjYsmYUF0t+KLaws
 MyMhetN8cI7rdsro2aCR1NACcoyC3E90+149x4CJrHprRW//SMJFooy5OWzUwo+Gc3X3
 mvEGoOI6/3weRp7A8SxaVTEyl7vsLYU5a49cDY4zzu53bLRVpDpyQSFtIWfZIgFcwDtL
 7srgiyNKud5QR/upaeFGc+LTNl10WIdL/wcn22Gz5u6hp6Y+n/pHoDWNWxf30s2enTB6
 d9EasecpycxXWpiBvYl6h8Z2TPNZ5755OAWiV0nPmPlN+FJX0VW/sfrkpwPiWeccacxg
 R0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWo85hzC3rFDGBh+qfuz6zjPF4f2jpRFQQPWDuhwYqs=;
 b=s9ncrYqxQ/jgPVBR+s3LTf2+m//SZVWSR3ZT+3xnChorjcNlgWxKxvfv7PtzAHhUCe
 Fxi+21sdPkk8K1g0hiI+UB00Mcki1CpVho+iHiCklLhLHOBRL6A/rqermjuSGQtJpvPp
 ZKa2lDT30Ovkv2QZhIvHoJ1SSrOgu4z9i+2PqUoZ5pbaDi+5YmubR63L2se/kU1DpE4y
 RBvQgq/IE5i1ROB7MCWbiOktwe3ZJl121My3Uoy3xV2LRLVm76jJD/iv29P5BlFwYaZT
 fM5Li57/gqXjJEAG//7v52kGk8PvsKaap77FR8szD/cx+3UXKH78BUdPKnf3vtwcq1wp
 myAQ==
X-Gm-Message-State: APjAAAXUmewY0IK0q7jpQ9JAXzSMwUbm/9A/QGNhNdjznbdxU0QijXAs
 J9zSaaVUY2uBjNW0VdYYDl7hRJVO0dcXab4S2Bg=
X-Google-Smtp-Source: APXvYqwEibktI+IxVNP8RRKtYl//H8Q1mpai1qab+3Ui3eiyhRWcHSzDlv+gK9gKLi9CwTMnjb/N6KWMP6Cc/KSQGW8=
X-Received: by 2002:a05:6808:87:: with SMTP id s7mr9359708oic.47.1571422255246; 
 Fri, 18 Oct 2019 11:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com>
 <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
 <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
 <1jwode9lba.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgSoK4X3_QbO3YpZRXNTpPJ+zVeid=w93f14Eyk8Dd32EQ@mail.gmail.com>
In-Reply-To: <CANAwSgSoK4X3_QbO3YpZRXNTpPJ+zVeid=w93f14Eyk8Dd32EQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Oct 2019 20:10:43 +0200
Message-ID: <CAFBinCBdwqxA2kLMAA9gtOcXevYK-J4x12odHwpQOAWakgWiEg@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_111056_845072_9FFA5BE4 
X-CRM114-Status: GOOD (  17.71  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Fri, Oct 18, 2019 at 4:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > Next step it to try narrow down the clock causing the issue.
> > Remove clk_ignore_unused from the command line and add CLK_INGORE_UNUSED
> > to the flag of some clocks your clock controller (g12a I think) until
> >
> > The peripheral clock gates already have this flag (something we should
> > fix someday) so don't bother looking there.
> >
> > Most likely the source of the pwm is getting disabled between the
> > late_init call and the probe of the PWM module. Since the pwm is already
> > active (w/o a driver), gating the clock source shuts dowm the power to
> > the cores.
> >
> > Looking a the possible inputs in pwm driver, I'd bet on fdiv4.
> >
>
> I had give this above steps a try but with little success.
> I am still looking into this much close.
it's not clear to me if you have only tested with the PWM and/or
FCLK_DIV4 clocks. can you please describe what you have tested so far?

for reference - my way of debugging this in the past was:
1. add some printks to clk_disable_unused_subtree (right after the
clk_core_is_enabled check) to see which clocks are being disabled
2. add CLK_IGNORE_UNUSED or CLK_IS_CRITICAL to the clocks which are
being disabled based on the information from step #1
3. (at some point I had a working kernel with lots of clocks with
CLK_IGNORE_UNUSED/CLK_IS_CRITICAL)
4. start dropping the CLK_IGNORE_UNUSED/CLK_IS_CRITICAL flags again
until you have traced it down to the clocks that are the actual issue
(so far I always had only one clock which caused issues, but it may be
multiple)
5. investigate (and/or ask on the mailing list, Amlogic developers are
reading the mails here as well) for the few clocks from step #4

> Well I am not the expert in clk or bus configuration.
> but after looking into the datasheet of for clk configuration
> I found some bus are not configured correctly.
did you find any reason which indicates that the problem is related to a bus?
the issues I had were due to clocks not being assigned to their
consumers in .dts - that can be anything (from a bus to something
different).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
