Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E3C606A32E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RLCZ8M6i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zseL4HAJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=48qBI2OaANC7AfOlR0F1mZmHFFMXusZWssw492EoK2k=; b=RLCZ8M6izj5tmef4y12F8zQs2S
	hC/qMjpmM8wI+pAB/JOol4bqbz8GSPmrJlXSF+gpYxjELL57YlXm5HGXJFCXv8M2jCvodB3BsOqwk
	DEvJohTtSeO2vfm3xWg04ThoogfijV/2FtNXEkFs6At+XCM5bzfk91sketEfmbE6otUU+cLzvQjfe
	8FFcPy/BKSnjahfKw/ujWvHitnGq+Xc5rbD/uXOyB4HiRgaTjNLMc9xpihQ4PrJ+Yi0mWM3MkTJ+i
	qXUxRtWqjKYGnKW/WljtsnbhIjza7/73OyylMEnI2SnK7tUEQUrT+usTwaDFEUvA8f4oG5W5kVHsB
	OxEfeANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDR-00000001pxo-187d;
	Tue, 03 Nov 2026 09:54:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDM-00000001puz-3QTC
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2029350f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699639; x=1794304439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=zseL4HAJxUO2eBE2wNbsdpyAxWKsUAr95onn/hzm97bqq6eFPgxdI7s7WNimZraWDj
         sucBdmkDiKmR/3IUXLaEyaVlegjXd7O/eKlLraSxAGCCkIVKK1J564xTqNmOHC6O0VCz
         i75B6MbLZf7U8T1QX0ySIbms147TMmYdX/aJG9jsixBecviSOQFC0tlLkkrj3WVyNdPn
         n1OUie4E6ZpXCPtfmXXHBU7WLkJLQEFjpPLEESfy4GMAr10ifT+kXknFMrHobE/ALs6R
         i+4vL+oYs9zDAERO8P7L4CVjwphKEQZVdR98oF4G+QiVCktmjJsB0iMXHI8PVM+2UXR5
         aR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699639; x=1794304439;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=RRy2n2KYFTOUyllwODcDV4jfcbSNEqjtSf8B9g92viMW7gtTYy+pIaB7FVVYW70RyA
         6bR82TIUyPSW3p7Vr10cJu1ZknBOWR1QsPk4WzRlfivFAK0nPYH+cdljTWa+l94gmkLW
         ON1XSqkUzcesjZ4bPPjF1K5gfCrQGwJ13bgyePYhgDHAERDLPUn2ZEThK0a6kziwuGh3
         gMgFdFezz4FZ2cy5f0uQ+8ECfSdFpBRFaX6MegUOMwECfQYCLy4ffSauKDkvFwHC/o47
         cuixI+jwioRGW4WmuT1VzZQ74Mm114laT0GKtyfnJq6MxitZynNGKVITkN1G4PtgOoea
         mnTA==
X-Gm-Message-State: APuU4Z+GeQTxgpftucvN6P5apt7hbHbt8/PKZSyPJhyi7UwPgvY9gxUn
	DyaKdJsV0ZuIeoR7JFjlWbK9ENpknQBnfJwcsFfO9qfPeXJb6bNWifqslw7CVVitAeY=
X-Gm-Gg: AYBFou2WomSlsZXCDpTEdoiEdzGa1Ddai+mR2JYqU1jSVljYCAt8VYU+owHcVF3NwCl
	xFRcYJmpEQc6592tiG/UbdjEHVvmiBV0WjA2THXmCs9GL0HdF3w1kEfkYuOnGa94Ci1NwwnuzYi
	pRpPepIq9PdvMnWzDiECUMPBCPEsHbuzM92tiKYL6mv/OmSUSERzcdCJQoQv3ojXCsqRHqG+hqR
	XDW/hw0c4cx+sbEW5L6lnENAHc3ogWe+Xd/dTwuvnRaRFzme+xYU46vK9o6hlxebpYnltGImI86
	l52lv38YanjxYxe+p6h5AkYqOOywcEQN/IwERnk6nyKVFL9jPpRzLNvrgh6Fg/q/OJxKtng8Lpp
	bs5DNMfK6xN8i0vbwPlt+CkyG5Qc0FsC3y5pE0ReBkD/RK7DgKGck9YtrgtOOhP7wixUoK8Hc/3
	JRAjbGXEyu97T87/2nuCM14PQrPiMxIZfEsIXf6zjQptTwCjDSA0MlYnYh0ImyS0Ro1FFF1/oj+
	XmciRxCnLfyo1n656p9VrZNbO7+GdMjyRKJ9odi/WFGSNd3AGGsEec52Jyq4ieMJuFcAb/T+f62
	mgN3iKkpfjvhx5ceySS0XqFX22nztsZDXCybKCL/dhf1G2hiEXzWNtkk7euuok2QB5yi6no=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr23618701f8f.49.1793699638798;
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm24029915f8f.23.2026.11.03.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Message-Id: <179369963832.2329937.7183164129825631720.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015403_346955_DDEC7EEE 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm-dt)

[1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
      https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e603da0

These changes has been applied on the intermediate git tree [1].

The v7.5/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
