Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADE6C04A68
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Posgrrt/v3RpzA9muKmQOysTpRnOmWCi1Oz45MDekqs=; b=ut/yMfbN7WOoNj
	XYoa/6ImqH/dvjDDL2Ee/hI4DkoYnJ3SPxPzlIYV2Ogb4XGqEXng03/tCPshXEanpozlXzI3KX/JC
	gM1VEEzMJ2ZeIhT9QQ5GmjNFAOR/Vjsk67i8G5tW2+r4i9OQ5+5inL1r+6xJYIaGW38A/Gm2H5K8t
	bbpNRcaorREyiqGqU7hUqkIJvqyuLnqY4H+jteOKvKKK6DW68iRv7m7Bs8VaUldDAs15lbL7EtTf9
	VUZSjmncUyPQKDRq8UfyIutn6sa05xUFJCx0pREHFBce/DZDyNOTrqf7L3Sro5OAg6FH41TDviQ3i
	1jFgkNrI4mfZHbRopzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGiE4-00EfGQ-QN; Wed, 27 Jul 2022 14:41:28 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGiE0-00Ef9L-VR
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 14:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658932874; bh=CDIsg8S3yqRI4I+cUIzsGvb6JmoeyfCVk74LQ7R1V1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BU5uFZDkUXp2H/XoBvP4qvB0M1gU7s7dQbx3LG12wjQh5apjbMLOg31Hvsrx4OpfZ
	 tEo6zGebL+SQaAZh77YmWR9S4nMi6MNfSthvFcjOoay7PQCfdqqsjyzrOt2ufq2XLo
	 b/BSucxZdUwekAi20znmN1j6RMJZ/lc470L98jWU=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id A4A93681; Wed, 27 Jul 2022 22:41:10 +0800
X-QQ-mid: xmsmtpt1658932870tsxdyl1wj
Message-ID: <tencent_27A429274A1A0E0C082FA6C700DA856DDA09@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85No4Gf/3BfqDrfHEQBMn9dQeLXU37wF5DLEI2g4OgNG0/lJQ4Xj/K
	 BWVgiZ1Fw4XOW72NLJiFbphIY4QptUi5tYUIMDxCHgmjrTLlfO6Z32SuLh92bW72efCusialcop1
	 ZhaTDLuT9sCJUjY9a2be/0pQcUUfPfvlJJCi8l/lLpK2g/+p+iXyPgQSH0J/kdOxLHzN4qBgangQ
	 6lN4uPetPF03RHMDLn8RsBz56hHrU86EAWWoEJQk88Uz+hIXQ8pIGieohPoESRWYqPefkX1fftoF
	 lYqhG9nnqjrrRgGchbcPXrxzAHI6BJ8lj6ng4YxNSIpCX76mR4dSXMNpggCMpDd23DgFvEhwGjw+
	 jag7uEYpDeqHUCO/ncWnooKpu1amPqikAWVG2nMM5b/yuGh9YduK7gKHCvU7hKh7x92PuuBNUn0M
	 oXx//UXxW1/TkNYeemKKNruD26ycjOpYdmDWj5MgNG4rsDMQgURbMgH1NlpYfqVKMoUx9mxzn/Ky
	 EpGSCu5lzEQsixYRibQIMJpF/lNw056FKqBG3g4EWL9SAhL256qPZX1aMFKz16DW6PYz412GWrpg
	 z/fMlOWu3fzV1noH9yXGLxQbdLGFwSPUR0PZs3KRJ/i924rpvmCkB6roH9TmG5tyyXi30OjcEMtE
	 dD9Ac6HbpU0NnBZPgvyhUbpPfiRF33Zz6RMPYszxf8U9lucz5BYbk7ffdXwVR0aAW8HOgf0BrKIF
	 xeJ+I5xzhFyu5set1lcVir3hmGBy6gn82OTjRpr5f2rPU1QKdZlFZi0D4zG4SSGQ1y+ckLHeoWyr
	 B1qL/LM7jd0FLNdGbsOa7rbzbMvQ2D0bD9YEFF7/5ut7p/gW1HFliO9aOn3LtgwzkbwZhQT5Oy+S
	 6VBgk9e5AzMEf3Q9rimBCm5ZDYOxvkjUdgacZNGdkyJ4Q05p9Tkrc=
Date: Wed, 27 Jul 2022 22:41:10 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
	sean@mess.org, christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
X-OQ-MSGID: <YuFOhoTGuO2eebo5@TS-551>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_074125_398691_446B9253 
X-CRM114-Status: GOOD (  15.19  )
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

On Wed, Jul 27, 2022 at 09:06:07AM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2022 16:36, Zhang Ning wrote:
> > Add manufactor bindings for Tmall
> > Add the board bindings for Magicbox M16S Tv Box
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> 
> All your subjects are still partially wrong. I pointed this out in v5
> and you still send v6 and v7 without proper patch prefix.
> 
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > index 61a6cabb375b..a67af2adf6a5 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -125,6 +125,7 @@ properties:
> >                - libretech,aml-s912-pc
> >                - minix,neo-u9h
> >                - nexbox,a1
> > +              - tmall,magicbox-m16s
> 
> Previously the vendor was magicbox... now it is tmall. But you write
> also Alibaba. It's a bit confusing.

Tmall is sub-company of Alibaba, if I use alibaba,tmall-magicbox-m16s
this will be too long.

and the first time I use magicbox,m16s, because I don't understand the
format before run checkpatch.pl



> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
