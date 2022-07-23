Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D8EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8xJZRP4f9b0c9++ApMjceKfkDjX5kBw0t7m8liFJHA=; b=R8hvEZL3Oz6msL
	NKRn2xHevdYbDzx+1CQzAHrdZQNNjmpqVbKzczBGKdqSvczrONYgX7bUYSeBaNBpSTHgzLuIlh3xu
	R7iiDmh1VDFSV9G/RC6yULuuJ6Y/k2jmodmPV45bZlhjqrDvakglc5F29K54QdG/uI0IKwdVfGv5+
	G4fjmpvFQCe/9phaTwNGqH+uWHrnebQNgdubjhB5L5WWRQwn2MFPOHQqM7r61VSSTBIzkOHOWdxTJ
	SJ3nEKYXDKTstp672aCO29uUe+5vn+ADpzI8SrWWPorc8jV1IUJydJ2HpTr3RyKyQ9/P2kneGqiw3
	NsB/Q/TgYGjkRA9KxWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFOSQ-008EmL-6R; Sat, 23 Jul 2022 23:22:50 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFOSM-008Egx-N0; Sat, 23 Jul 2022 23:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658618558; bh=J5yz2UlPZzlr8VutS66ApnmvcGQfcASjDVwDwYhj0lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i9nBF9nmwymnNDotWgzffKlHOpTtj9CiCjMO3n0pTKl8diTXKjOpZn2zrLL+Yj4vK
	 y2vSCAZeBqjFFHLA01vJaJ435nB6N/OlWXtG8I+hX34kULOxGp6Q1K3ecOXAfwUked
	 vfLCnRWKBsJISJqPPpAqpCDnmvFSvBzUU9ltKbxY=
Received: from TS-551 ([101.229.115.105])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id 5A3B64DB; Sun, 24 Jul 2022 07:22:35 +0800
X-QQ-mid: xmsmtpt1658618555tjx3z1lor
Message-ID: <tencent_EF171E6351ED283605D2BF133C0D0F064408@qq.com>
X-QQ-XMAILINFO: MVKy59SpMLfUZgHwueQPC2fD/uJMVoX9sA1W2LHdhZ4Fx9QLcTBMzOsIs1VhO4
	 XpyIGKRhILQrK3vLFkiC2g9pXG8FfswPQi2On5vJvDfgcIY2MSfS1xN0ciNn0SdAICnWgL+rWUic
	 MjNk8r214ru+SUutTPh/tb9w+zDaFV99J/iRHyIBXahEvKDuuLRw3FwaNimbsS8mTDG82lI4Zd6K
	 MsUv7pEndfky31Vt60+A9iVogyyXrDocbCqdeaW0bOUEJzfxoXtzPgepwDg9adVdI+TA4Ulo4x95
	 Mtc6JppGzGYJA5F70VFgWt2GxFIJLOhhMEO5f/oHYnFwuV+J5gRtp+a61NTCCfnaVRs47wdqDfw9
	 amgFOCD+J9dldvxjhPuoW6fpDUHIePtf5QaFD+VNKKkMO/qTU07nf7CcPlHnrX9o0yoMTCOKRJtq
	 nXWdDxPUrcdeMhM8sNtjH1K7JC5ZcFV3RK/UdFC8XtHKLmhSE/gW+zCOPWjzqCZpja1dbFnpbrNg
	 aClwTXPwJnGyUVKON/VA31NrNwrG7PjpJbF0kznzeaYEkqzv3K4prLyszoiE0rZ7VgeycGdXmuUP
	 km9rGklU8el0Cz42XWp4EL2hCrOlARRNGskuzFCWTHjpLi5MPijTBPQn/AvYF/8hTYE6q9u9Rh2w
	 Etxo30TecL2SZv10MSXfRQTIXGl8GDwDtYPNuuGG+Puhr5LvWGRE9gCK07Vh1N2I/ezJTpRtxiAi
	 US8FVvDUDmGziPFaAg2e6aiQqkwG9G7iz76ANg5UdLD5oiaIu+82Iy+a4o2PHv6CK52tuqa72E1Z
	 1TYmlZAH1Vlsfn+0+kFZsYU03ADwDH0I/ESk81EfuJ3fl8Aoeuujcxt7vlIMvB7LE2hSazx9Hgf+
	 54ipnPF0RAdVEgYzSRxHJPjBCoQBxW51O3brz+4byFTIupwP9npaolBjFKt/h86/4mkhWy3++R
Date: Sun, 24 Jul 2022 07:22:35 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/2] dts/amlogic: Add MagicBox M16S support
X-OQ-MSGID: <YtyCu7W+jhCk1OCA@TS-551>
References: <20220723155502.127404-1-zhangn1985@qq.com>
 <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
 <CAFBinCBr=LvMywLJMeSY3bgNPF1tV-Fs4_kFb4jXUm_F20eGng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBr=LvMywLJMeSY3bgNPF1tV-Fs4_kFb4jXUm_F20eGng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_162247_115660_B7CDE12C 
X-CRM114-Status: GOOD (  21.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

thank you for review, I will send next version according your advises.

On Sat, Jul 23, 2022 at 10:14:40PM +0200, Martin Blumenstingl wrote:
> Hello,
> 
> great to see this patch!
> 
> On Sat, Jul 23, 2022 at 5:56 PM Zhang Ning <zhangn1985@qq.com> wrote:
> >
> > MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> >
> > it's q201_v1 according u-boot log.
> > and it's almost same as Q201 reference design.
> >
> > add a simple dts to support this Tv box.
> It would be great if you could add the hardware specs from the
> cover-letter here.
> 
> [...]
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > index 61a6cabb375b..3eac16a4de68 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -123,6 +123,7 @@ properties:
> >                - khadas,vim2
> >                - kingnovel,r-box-pro
> >                - libretech,aml-s912-pc
> > +              - magicbox,m16s
> >                - minix,neo-u9h
> >                - nexbox,a1
> >                - tronsmart,vega-s96
> The change itself is fine (entries are sorted alphabetically). It
> should go into a separate dt-binding patch though.
> See commit 3f7dbd336f360a ("dt-bindings: arm: amlogic: add Vero 4K+
> bindings") for an example with the correct title and commit message.
> 
> [...]
> > +       gpio-keys-polled {
> > +               compatible = "gpio-keys-polled";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> #address-cells and #size-cells will be dropped in Linux 5.20 in all
> existing .dts files, see [0]
> Please do the same.
> 
> > +               button-power {
> Button/Key node labels are updated in 5.20 as well (see [1], but
> button-power does match the recommended naming so no change is needed.
> 
> 
> Thank you and best regards,
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4956be9944d1fb23107f27bad8a2cca0fa167443
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4fd9afd894ebe5831dbd737e6ca7b6de14da7fda

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
