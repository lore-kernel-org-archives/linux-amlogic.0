Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA572C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 00:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7tQMYgj3MsCemHoBL8wGUT2mf1TjAeLxcFeJOrs3O8=; b=Lol2TVRdQYi5ow
	b/L1rp8FRTRQcE3M30sTmViD6TvOk65WAfI7XcY64Rt+Gd1gREqs7iDPvD5tifTRrxVuFjquNkveJ
	FxZJ0CRwq/Bxd1pfWty7FAqLg7NazL9EO0lD8EMUoJ+uxZaAdLJaFhe9JqEZKwR6z21QnbvaEfKve
	tIhOVDUE+9Yi04E7Fa/pcAxb0X0AE2PS3jWeIfZXX4Sfd4VMbgHfIVUunRGF17TnnOY3yO+q062Nv
	LWU4xdnayjl8ekIwW7zWlsHm7p5wSGYU7ND6LcUHYqAucpxfae/h1GTKb4AhoOj952d/rHJj5arfl
	9JDcp5YbdZrzvSlB5Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG80B-0055xG-FB; Tue, 26 Jul 2022 00:00:43 +0000
Received: from out203-205-251-36.mail.qq.com ([203.205.251.36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG808-0055t6-PR
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 00:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658793628; bh=nOUJdS5Gt3l+DuQRzFiCgT2qdIjOUJ3iRXqhMvodLNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KJ01lws4zKZGGp/RXMFgileVdgYXUY97Wu79EkbV+wxCEDrDcbccjN9QHtsGNLAAW
	 UwlAnYuQFZebBSqsJiFHm0f2y5xryUWFoXlA2od/kIIyK2KYrbHJcbhkyJ8XVe8xiO
	 sd5HroBp7Jbe1i52L3+Y66EmUs5uDL+EPmhuc1cs=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 18ADA1F; Tue, 26 Jul 2022 08:00:24 +0800
X-QQ-mid: xmsmtpt1658793624tgqnv4v67
Message-ID: <tencent_C4C0864CDA7422AA81C080EF226CACA5FD05@qq.com>
X-QQ-XMAILINFO: Mv3le6n+CjtdJ8RFMj41RnOUuiZEhRuSHr3NUT1u2IQ2qQVdlB9xCBj8SBa5xc
	 bGshLLgzk9nC/wYlF+ao8z55Ld7hc/LI0uF7fUF7nWljMQIcOiPNituAnyeKBs71WH7HR4T26//R
	 HbYaZ3whjqUJY9HZQ0Dl3ylmAHh0zW9Jn2jyVGD8LphiQz8YWfV9kFr1L5DYDQjdyTZ2Zdjln2Me
	 +bjZF8sJDUu/s/GCZ5yR3A1IdnkaF7SO+MCDckBrsHgp9LTvrRNsEFed9MChimYzSqu4MbuPk8XN
	 GNQC7/DUKC+hFShHL2wq0x0jCQK/kiNqTAdshSo2Q8BOxDsIyJN7wjnhu2uj/pvdT/ea1JVIjny8
	 ov4jwuRVpY7BghWikIm+7x06gO/RGJ3G9WyECBKzQBthVot7CDOeJxavcjFdBGsTkiOTP1wFuAtu
	 O7VUWUL9gWBojlddFixSJqTuSCRoCldHVZjzBVeMuFrB1lVMAYDUJ9FUFxjdZ2/HAbL8rjR3mlz9
	 rTqKj+Dr8TOYEvDX2+TGcaAzSvWAO8WCW0TTU8pGUBF9xkW82zZc4gpRkhsQHDct3/2E7Wv6GtqE
	 Z3pCYXlLkuxjenG2NPG+syEw63iGNgt/0mGSq24Mt8eU+uGur3AOL29GE1auKqzT5dMkkXDPUKg4
	 aaH+0o0YruEtwNhdNV825Gpts+X4/LHVQb/dEc6KwVofyU057Pbue/k0KN51tGp2B9/MM+nK3cql
	 IgRUEZBzzYlwCX5HUjlF5Av67F9nqRbtiOAGlWvje+6JX9x33waAttKJ1dMCMPcagLCa9ysPYqUe
	 PqgmppzR/cGhe13+q0oKLfB8hJyG0I0X/aYaIfpkHdYMu7UvVXnkmsGkQviuhi/883w8CM/vVuiI
	 4coeobCaNTeys9zilZVQjWNgRTykej6Q==
Date: Tue, 26 Jul 2022 08:00:24 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [v5 3/4] dt-bindings: arm: add Magicbox M16S bindings
X-OQ-MSGID: <Yt8umJ4x7Ma62Tiq@TS-551>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
 <efb62771-4a4c-c166-7a31-0e44df2c0908@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efb62771-4a4c-c166-7a31-0e44df2c0908@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_170041_314526_A5EF3924 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 25, 2022 at 06:31:08PM +0200, Krzysztof Kozlowski wrote:
> On 25/07/2022 01:17, Zhang Ning wrote:
> > Add the board binding for Magicbox M16S Tv Box
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> 
> Don't forget proper mail titles (PATCH and prefix). git format-patch
> solves the first, git log --oneline gives you hint about second. So this
> should be:
> 
> [PATCH v5 3/4] dt-bindings: arm: amlogic: add Magicbox M16S bindings

Thank you, I will update it in next version.
> 
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
