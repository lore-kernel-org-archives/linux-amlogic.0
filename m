Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE0ACA101F
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw77wld3Vk0J4KrCs6XE6wzN8H4YahnmKwD2QwrOFJs=; b=bevceKGb6Wc2kB
	JaDJKlC1bd0WsTRs5FFqFsDRNyXJstiZK0b7egtbjVUHABBmUTSSxPatIv296AgJ599C4JhlgWKfM
	56BePOIf+1xN+2CkaLw1IypfXnbU46IMUsUzwuw8c6knQ5ZfJITvEO+jfWuDBrLSC1g6lLwPKWuSY
	Gi3McYyZIwI1vkogtKVVup6tpNmftje1vfOjeA9popAjtZHlWlYmMt4rbCP/U/1/bSiGEKJpbFJUa
	bzSoYokZL7LvovGfCAl5w9Ikicy+oANMNpi/BWTlWaIvxK5cDvEIL/Mj4GFn+0mUmJ6hkUIuxNBZZ
	wuI3hXm0L6uYXp+oGtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSZ-0000000CdSM-46CN;
	Wed, 10 Sep 2025 07:41:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSZ-0000000CdR3-1Nmk
	for linux-amlogic@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WtBMCZXPDe/L1Aera+ZphaSp5CFgLXQkaXld4/92fyk=; b=Vlv/NKtStyi3Gt5nSR8AuSS1aH
	WJDfgf/wun7qI8BAsioAIp5eWaU6WFllNMOGBqmT38Qe+Q7fW2AEq8K8ROinddXaoLmvDdUFeW7TQ
	mJ34yFXODO2LJRv9B6WMPk7UN8Ijusr09F3wRWddN0wi5HI2H2W8wljF2hilQ/juSm5gHADBMkfpb
	jEube86KZ8h23Zokth8rT3mrFM1o9HnKh8IEZNey8sTbPN8bn7vetm4mMLN1hhA8oEVcGo9qL/LfZ
	0AqDzA6BMqtGgLgwWwDZlrXAD68VS2JWT8KnUshO8NyejZc/6Os/0vY6bfNJREcPTM7IuYdc0MQnP
	DwkjIHsQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSV-00000005mHZ-40Zr
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 07:41:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so3665049f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Sep 2025 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757490098; x=1758094898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtBMCZXPDe/L1Aera+ZphaSp5CFgLXQkaXld4/92fyk=;
        b=QefSyovhCNXB+h+RK854Uucf3ZM02223Cp+9sgaN81wefpkonMt++TC9931h62Un0K
         HXAmvGXbC1F8+o3u+Glh+tjl9heUj13EbnxMOcEL4q7eZzaX/rfGpc6WRcfPImoJISaX
         BaBB15yZ0KNbTjj97mfSowNvH4VLpGgh0ZlfG4imIw/xNJr6r6YnjU1NRd5rLX+JGdFS
         L5dTm6L5GM/Qdzp+dlidHltv10hpMdGiAGspYNbZNJN6OC8Q8yWPLTBpVUg/qldDV8Cz
         2e1xoaSW9MNHvNvC6uFAITaqFjYARIVcUkFXUtNx2iTCgLZaxVSD0gBiC4muFXS7p8rs
         E+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490098; x=1758094898;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtBMCZXPDe/L1Aera+ZphaSp5CFgLXQkaXld4/92fyk=;
        b=AWyvw8TxrHlrX0JWUuHMaIVFJVb/cn2U9oIcksDZ4EyeFaLC1oPFWcDn4jomT+KR9N
         fHC3yX/d2pGk62rSuJMdMxi2azjte1Iv7co51XxRH2XlSXrdv1Sf1cTL03PgAiaQOeO3
         sls3h1Kd6YCoxSvQqOU6ZWpOhiPj6Zou3kBby4e3DJH267H+X5r9byNtPH64y61qv+5L
         hurPLIo8NID0etV1fx2jqpewqiRToRuq1IlNf1VvegrGILoPO5/XAc5zkpCnv3kWUcVc
         7L7w9L4kmZduZZHfl6pAJIT+rpPneR0wrdhbIvDMAYOgROL6seIKf2HadJ/bTz41w/JH
         Veog==
X-Forwarded-Encrypted: i=1; AJvYcCW1IBeAh/0jDbwwShL80eDL5RtxbPoVdH3l1zKfhy+ndqZJOQcbsitgm2YKa1+N+Irn77+Gu1tNAVqquMrS@lists.infradead.org
X-Gm-Message-State: AOJu0YyJNf3L5mZmz/0M/g8I5FowpqWFQ9T2xV0nFElT7lwYEkCj7wvI
	ViTze7SESaLHiJJILTd8SEjSFzb2LsPoGQPSZzbKMa7VJtA0qOXv8TqK0B4D3ogREGU=
X-Gm-Gg: ASbGncveFhDIJ4LSh1KxTiRjewn7QdzHw6HXXDPC1jqXVYlhKitt5gGlHLHLzXARhA1
	tZeg69xCivUKx2phJdexf2o/75/jziKMCSI0RL5DLtNJNgDQy75cVuCxTJzzVx0ndM5WptYrhbk
	UNh9GUdbEv0VTdEaCrmcnaLbE91oZTubzL8yVL7NV26yUKqppjnplQbwGECnV60pbzGKC+MbcoG
	S1WgfvBylpJE099buijc6kD1mxqHjfGFAPOlCx9WZZbQbwCpL0J4pMBpMKqgfFUxdXIfu6AZk4x
	gQCxh/uB/7Pql+uBSRUN5gqvLwfJGu/27jNwfMzDH5dwBb9CRTKFD+E+SzdPAyHzF7ASE5rOfNB
	k+tY7fADqxrG7z4eUKvxVF23mZYq2pkwXUIYUmVyf12s6jRX8MeaOtop/Cc1aUcZx
X-Google-Smtp-Source: AGHT+IH3qq2tDxg+cTZMTeDKbmE+EV30unSE7cfrGi83s7nwsGI6zF0cGpJrbn+Kkyr1dX1PgI5lYQ==
X-Received: by 2002:a5d:584a:0:b0:3e0:152a:87b8 with SMTP id ffacd0b85a97d-3e636d8fe92mr9774755f8f.8.1757490098349;
        Wed, 10 Sep 2025 00:41:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bf7ebsm5995264f8f.3.2025.09.10.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:41:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250725075429.10056-1-johan@kernel.org>
References: <20250725075429.10056-1-johan@kernel.org>
Subject: Re: [PATCH] firmware: firmware: meson-sm: fix compile-test default
Message-Id: <175749009786.1189544.12133292014969519792.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 09:41:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084140_196323_70ACDD73 
X-CRM114-Status: UNSURE (   8.98  )
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

Hi,

On Fri, 25 Jul 2025 09:54:29 +0200, Johan Hovold wrote:
> Enabling compile testing should not enable every individual driver (we
> have "allyesconfig" for that).
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/drivers)

[1/1] firmware: firmware: meson-sm: fix compile-test default
      https://git.kernel.org/amlogic/c/0454346d1c5f7fccb3ef6e3103985de8ab3469f3

These changes has been applied on the intermediate git tree [1].

The v6.18/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
