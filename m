Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59A9C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjeHJMBUVuMSP8xHpzby7cBMCpP8NFZc3YYDE6W+81s=; b=pvVwb2mkpdBml7
	MzWZjz56Ytfn2l/THJSh2+OptL76OFKp5TRIUwhQQdzIhjEJ8j0V3zfX3EDxxRvo3Qs+GkkAsIjkc
	oPxDutTsV2B6Zo9QbW1f9dkd4s1Ia5MKlYLe9qvYxweaILBQTlXCSvGmgYteHlHKUgOYmRgwCqgC7
	Qq6Mrk4drqQRen731k6bviNKVSQ7I+UQzrr5Ovgp2lIjsHBeDL5MefIuoLBMo5sAXlRd4bwGH3oHG
	RIQJeoT3fhTiJVRyN5WOtkyrglTLqzUjKNXdn4SoUkypb7RwPBhAUZA1Y6pcDDRMuEV0lh76m7LV9
	NZhLzYE1DRNw533biK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRy-00000008UIQ-0vfr;
	Tue, 13 Feb 2024 08:47:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRY-00000008U2O-0bYD
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:47:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33b2fba3176so2441048f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707814026; x=1708418826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bMuvH0iAd1PF1SqewdYWpyy5Y0tdOMX7cQXxUHvDxE=;
        b=atp5XXiJB22uEmNHdltxdWCu+1eDS1uRIREq2E0tHm8l+B9uI9oFdBDq+SVUXUrHM1
         SwVpXQRCfnxbmED1gx7UG06zrwVrGQ4kptMpvWJaYY9HtHgAN2vdNwsBLkMKm79p3KqX
         lTCw50jO1RjV4SVKfbfUQfJ27yx9QO2/CbRB2kd6kScBC1L9JXh1jO3n7icWW7dY42nj
         guTEu1xuwqg+D7Ze+E0j2jQN9Uc30zxPMb+afRf0C3bfxGkUD+UVKXADfMiI3OFUQ2xE
         5SA4KiLV4qtOCLhy3Nd9oYF6WgC3/pAqIzDgITk5+OS3egHO2p3raMbRkcUrrxPMriBW
         03wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707814026; x=1708418826;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bMuvH0iAd1PF1SqewdYWpyy5Y0tdOMX7cQXxUHvDxE=;
        b=Mhdu9/nBLv7SelNybB2Fe4vLwgmv4lABpWg0uGPwbKhp84jAR/4dGUzlgJdfAk0Bbw
         1nqauR7K5dPcQlSKOwuiMYoYp868GNfSW9hRTOFWXiikEYf00mFOuRTml3WM0r59jSMx
         w6LzUeD0ckhMiAhRqm38IIY0o5F8hxJR1PazbAfY8zo/DU53Y9bMua29R2eSsraYADM6
         yjRvgFu6gyM9D7NYZHShBOPmE/N11zxPAUUqmWBiUuWm8gzsBDWfeCCQqW2RlB3PDUsf
         klEKhO390b+YREnou5S1skkQaQRorm15M+dUlJ3B6rLGHT3KLU5F7LWUipTsmaXpfzmK
         r3sA==
X-Forwarded-Encrypted: i=1; AJvYcCWPxrMYuZEzgS3oQk3085FW7+No2AbjmjDST375bcdEDX7GPfHQUbEaUxA3CgWFd/9OAOoyUD38JfvWjQGEwkVV27lLU0JF3T5XCBLmpdt5/3o=
X-Gm-Message-State: AOJu0YzCpLX7xGkuHYYwyQ7jhFOrEi2T1f9Cdy4Q+sLWSEDRSPLzzZw9
	iVXf5QGum2TNnujARSvZMB42bZbaVKqPIQ0rxAB0lcsT3ouauodPFvy5k9C8Ap0=
X-Google-Smtp-Source: AGHT+IHvZXD6aTIXgxH0gj/o6SMcypm6Vv7aNNwbZen+YjTIa0tXzmaj5smryIRlTZy31rQVzQ3gGQ==
X-Received: by 2002:adf:e848:0:b0:33c:d9fb:2277 with SMTP id d8-20020adfe848000000b0033cd9fb2277mr547252wrn.40.1707814026377;
        Tue, 13 Feb 2024 00:47:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC1qJ7tZeYGV3VCxAPxWDpzfUgIzUvslWupu8cLCnp7RwIrBfwoDSzMKdhtqVIC5Lz+SjPJ/OBBTfCvWbIXfPWLY9Cv03a5bz85A7BxkXkF6qZDhitI/8rSX87ZIVoHC6RLEe4EVKA4TuxkswMKn7/g4X0zljBeHgL97vVvp6uu9/1px+7uK489j8KJGw0bBvwvuHR8DZ+tY6oApdCKMQpRqYT33/2lV66/k9s8KAXFCK2ayPWAYIIpM4oijGt2P62Y5BZInv/Lo9EuLpVRdS3C7tONGSUpUN3Ma7IB9X2Qam4Kw6ECH/itTPkgo2FWPdXy+mFCCXQCkT5JLE52A13q8e0HkgLHxIKI6KKhOmv0xANVo6G8KZUEwr1d8FGmikPTqlrdmPoS5Xr0iGiABs1qFrOpXSShhIa8RfShXymK41Au4JE5ksD89iWNQzQEeP90ZfW
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4708000000b0033b507b0abdsm8888707wrq.32.2024.02.13.00.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 00:47:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208105252.128940-1-krzysztof.kozlowski@linaro.org>
References: <20240208105252.128940-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: minor whitespace cleanup
Message-Id: <170781402554.1503948.12321560831974589557.b4-ty@linaro.org>
Date: Tue, 13 Feb 2024 09:47:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004708_343717_E53BBD07 
X-CRM114-Status: UNSURE (   9.98  )
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

On Thu, 08 Feb 2024 11:52:52 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before '{'
> character.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/1] arm64: dts: amlogic: t7: minor whitespace cleanup
      https://git.kernel.org/amlogic/c/9225771676d14673acd225a48eaa49ef3998af41

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
