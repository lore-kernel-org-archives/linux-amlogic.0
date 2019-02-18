Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E30C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 17:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0375520C01
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 17:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tuRiqwAS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Erd19qeJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RoSUQj80"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0375520C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WF+qHZ4nirPw/s+jXsyMJ+4qcIq6lWxAGfdnwgJyFE=; b=tuRiqwASnXa+xI
	SotPkLowy9EVxTOZMt15MOweev1gW1CzcLFh+VMIUShwMRxNv5u9JcsrFXbGX7vLmijDNVCzJZIW7
	FVhvQTwZ5Sd5iwKnx+lFI5XXcBx6ylFxPphJLf/02WS9bXB3aumlclIkFnMC9LeuVKkmKW6lrp8w0
	XrVAOmTSwUAFtwb4xquACiD4X2V1tHlcN6jJp0k/H6nLx+W9rTC9o4nDBCwpbsYNFjZKn80BtxQGP
	mJtOjA8y45tawoqjB5qyy9vVVJEPCUfk6tG9ZP3i1q2pAD3EJL9TqbFI5L+E7j+Xy+JUdN1TTfHYK
	OU+LQ2oLfutPdrFm2gJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvmNc-0008Nk-Pr; Mon, 18 Feb 2019 17:06:56 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvmMs-0007al-F0
 for linux-amlogic@bombadil.infradead.org; Mon, 18 Feb 2019 17:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QB3mMX0BAjJrPVwi99JxJOqNOtsneoMPB99GD8wuD4M=; b=Erd19qeJ/0C4nC7lnSAabuHINP
 0VpidgFPy66VxmWF++7BPZ+dAx4UTtaRjlli3OtMZwUCJcKprbwXEWLJ5BerOV/u0HLbi6TvE3TTa
 sFXCHCC7wZaz9AxTDe2BkQd0pedpGc7V4osS5j4Uva4ybDM03NYRgjyyZaOrxJV9vT1VMWheK/f4r
 9dCYDeK50kc16sZcvYcbzpGHPCTcGq+rmaKH8sC+/ar6T5HZqkHWQ/L2dc1hWevBU6IBmth0ujDVC
 pOu7n7maTCg2lzPde9e2rzmFhLCUtTV50NpDSbcW4ARGC+USPeXS5h14BWGnnspOsUBycS0jqw7q4
 vsM0sRdA==;
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvmMp-0000Ja-0w
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 17:06:08 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 1353910C1029;
 Mon, 18 Feb 2019 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550509562; bh=kcZZRim/dDY5VsaQSUqm/M/3X+SgTQwpjqTpw8X6gnU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=RoSUQj80se/m4dZQTZoBmTeauJ3LSEiejF9qcW6tMdyRK2N2raiNWlCR7DCMUdWTq
 fEJyGQ9OPhuiO8vacB/HwjIGuYQpn5LE377kEyytOJHI+oRwJ0Yb1vdI4ITYzerCDp
 u5jV7Nbi4WltFWteOO+ci8dlFX/x4Gsduxv4GUS+tqtmmPS00SfnsOedNlVrJYz/Cx
 d6eiuje9eWrYqeOfkBagT+CHwy6oEqJmeH9fizBtXAqBol3eIXZR+UYSeT5TzOHsk5
 IpGyonYJpOdaP2dzAALw52PgVZSUehzd1ERDpqSHl3vPNVcf0cjV+O8IvrkUi2nwz7
 vsTpGqNvmwGYA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 63861A005A;
 Mon, 18 Feb 2019 17:06:01 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 09:06:01 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 18:05:59 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 18:05:58 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
Date: Mon, 18 Feb 2019 17:05:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_120607_315093_C71C1554 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2/18/2019 4:51 PM, Simon Huelck wrote:
> Hi,
> 
> no im testing vanilla mainline kernel and against 4.14. where
> performance was ok. but turning off EEE via ethtool should have same
> results than removal of that patch.
> 
> But, since it was mainlined recently , not long ago, i think this was
> tested ??

The thing is that phy_init_eee() is called by stmmac and this
function does not take into account the broken modes if it's
called too early which will cause driver to enable LPI in MAC.

And anyway, if you have lpi values in the ethtool stats then EEE
is being enabled by stmmac.

Please try the change I suggested.

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
