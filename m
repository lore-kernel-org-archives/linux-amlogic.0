Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FF4D29FFE
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isnKyH58Q1AjFiOuGYF2o8f8dj1tdRKiDXATXObZdRk=; b=F9Tay344BB+vEa
	CfmlSubMJGmIVSvtQ5zkyRecY5XzKTUUEhLNAa2uFWDxtpH2NB8g/JOKWVkwwwHYGzxISl3bGjcZu
	IgIXrrvSjr2zZaioIQubCUKsZhoETHlPZbp8VOIb7W1f0CthTHHDzUjp8wLA2WOkCQdOO4Gn9PNVR
	BFZb6xbNI1wBFfHdsnsEc4J5p3hKpbDWpOhRWFXNruo47Jk4/dYw3RhSMqgoue+NSyk5H79oWlvLP
	tddcHOnkJSwNGYjveEyLcCUBbl6fYENYKdq9BOv9lf4ADK0t1bPPxUAEIxraWUCJHtfBhRsPLxBUs
	zekS6MWuVh91mJQgp14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzid-0000000976b-0EtG;
	Wed, 14 Jan 2026 12:11:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziV-0000000971x-3U41
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-432da746749so2704088f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392674; x=1768997474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvNQSaYKyUim5tFkK4HAPN4WA2RLqZuiV376Fz2XMpk=;
        b=ePZkmR3z2tEkg+Jc6kK2ITd3pGTdXHl3wt35Rm9UYfddL6hCohS5vGej7oajDrw95x
         R5EuQdCzyRP65A3iCpvNBYPl7SyDucCao8RBw6T6sECfrCJubSf3xXEYOEo6akg//VHE
         itK+P5dNOu+7PY2BBUQNkHtClxhxFvACGvTjDVZ8dVqHPWNSLL+z/NyK5bVF+MI2l7v/
         PSDv/Qiw4TnqvfTJJNdw29aZOffqrE0BcQWV9fLJChz0E8utPxdh5Ii5lqbUXWDY/7eb
         WYNQUv3t6KdjS2hBSUlJcbEoHsH6Vu+bANJ1f7HOop48yjURSILf1ZjIAZlsv8HpofIi
         8YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392674; x=1768997474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvNQSaYKyUim5tFkK4HAPN4WA2RLqZuiV376Fz2XMpk=;
        b=jbpa6lXtNOYLv59txAoAXrjqiR4BEpHES/BhRoBfZwGNQZb0SIbr6idJrCt6985jZ6
         jQ6aDu86ZnV/yCkldRWvBUdxtDkE1PsFDAppCi8AuhSW0Z6oRoCkB49iYNDKT+TbI9MU
         UjVwkAKM+ChhpgP/f5Uv0rtC8WaQBq24GHAbSKZ+MnLjTc3S67zkDivNqmdvidi44SDl
         prqd7rjGu/6wLtwOb2tE/CbCpJwzaRBa88fZJOmDcLZPY5/57OwpW8AI4sVseQD1jmf0
         7ZTa2YlPVa/tIJ7mWTdU/a8FdqIkscmmuwtxUO91CRjtGikxmteDw60k1i/Af/k0nhUP
         dasg==
X-Forwarded-Encrypted: i=1; AJvYcCW6pVg67VYVMETQkj3tMliXoCIyhvXYWNNJhsv6sTomfLC9NRhev/RNvjcvTCnZTxZpq311G7XYPl9WHBgj@lists.infradead.org
X-Gm-Message-State: AOJu0YxzuCZX6d2lWvHJbxwSqyK775V8PkWnhRP7ZTcQmWSMikColcvJ
	iGGs0LVF70tb18GQDbly2qlT5W+dJDFLl6AK05eXpI3g/+Fzr88K4dLcnu8O+zq0wDg=
X-Gm-Gg: AY/fxX6qhSkMy/m9+UV/trWqrDJEoAR1HEYgRoiLbGHS3iIIjuwqYWj9M2f7RpCuMCp
	X7CmiFUkJap9LRp7Z2JPAqUjRjKbjtOL5tRJm8ZWyrZONisPNMt9aup3EbZ+8GlzcAM7D7FAKDT
	Vvu08GqMpgqat+CboOhjfLkx07myewsEinijEFqZpo/GNjK6f25FYy5IDxdlguXX+0tMDsNIUvh
	Nj1/iHeeBIFpM67ezO4h7vSs5YYhi/IilotOO/qWz2UJk3qjAPsHSGaIgoV31mFv6mukauv9IG6
	ZoSeJbkPGhYiwNyOWs0cgYqT7KMgyrFdTYBa4aJbxKsM/FSQHqqpKDv9Vs4ibtyu61UYzsahlFu
	QurpQWZ3SP3ZMmETN88hP2S6MFZnaulcAOkqmwFSKCmSua4zjQEdwpBm+TfBHnxM164NtI6v0x9
	Y2DXe7NamM32QRPqD1gdDNn/dDgGEqkwA=
X-Received: by 2002:a05:600c:500d:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-47ee33917d1mr23304285e9.23.1768392673795;
        Wed, 14 Jan 2026 04:11:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Message-Id: <176839267313.2837299.1195775819800428515.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_471316_CCD7A44C 
X-CRM114-Status: GOOD (  12.67  )
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

On Wed, 14 Jan 2026 11:43:10 +0100, Jerome Brunet wrote:
> The patchset aims to address the issue raised here [1] for MMC B.
> 
> While checking this issue, I've found that MMC A and C also appear to be
> improperly described in this platform's DT. The 2nd change fixes that.
> 
> To be on the safe side, the MMC clock should also be assigned on the other
> SoCs. More changes will follow once things are sorted out for s4.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      https://git.kernel.org/amlogic/c/86124a8becb43eed3103f2459399daee8af2c99d
[2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
      https://git.kernel.org/amlogic/c/3a115d42922cffc91b303992eadf220111d66c31

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
