Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B9606A321
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zSuv7QcQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=S3eqfBkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TMhNz4c6Y8eNXep+xjScur4y41LN2v6esrfeWVDb6gw=; b=zSuv7QcQKgGDxzpa7S8nRFlN6r
	TQSZ77XGxTweGW+0a0+++9GDI/ueSlVK1xC2TmTe87hELUkkDZDy0h/TIEaJc/0NTYfTlnMuTBhBw
	qOVoznGiSn6vpaXbuPOqRZBWLBRisoPG8Xe/EHcjYvy017Ab0m0Y6TUyP1jR8WvDivVYqfQe3NxqY
	kptOk0vwritSQ9Or679aBpVZtgj9OBQRenRBasFYemrbNQb+TSIE1/xlfsoR2oPzpelSKwPsoQUEq
	On/iu24X81dUhzANMwbkot1LHfSJdFrcsORiNuvjxJTTV/jARdEehj13D0xGxrD3eVQglPutFBnfq
	og0gCqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Uj-00000005qoI-3rYo;
	Wed, 11 Nov 2026 07:11:45 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Ug-00000005qnI-395c
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 07:11:44 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3610807d50.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 23:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381101; cv=none;
        d=google.com; s=arc-20260327;
        b=l6YJN0NtlbMzIkmv74C34ZrVeO+T6jWaO6SZbinX081xCCHiGlB8L6xYOkEw2dURcX
         nndIagY5geHPlADkWqyXBgxtbLwQYnEU8lWUv+bQiICbKW0yvxgMvWdoardPswPCZKz8
         OHi0WB5l5GBNyn4Hm5X6wQ8eEj/c1ZAEV+yIdaMktwIJZYHJbKuECGnEJ1M3w7b0Gedg
         P672sHmwl0wwSifv1nHCV/xJ4iaUgiMpA+PWLCTRH2wxhpEf3EREN56tI36NMJHw7N6k
         72iPeclEHBvoZIFAJ71jV8ZL2wX/yp8NfByVM8p37N6/K1YDOs9t5OlgIKFi3v6S0pSz
         hCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        fh=XKTibk/53+RXpECguJensyZgkRnpQG7NCr3EqxlfJZA=;
        b=sxdLawsGdqCsaD0mQp7bdYIrO9AcVFjfJs/kKfJ8Oukf2nax8OsYxazC0XBxMInX1v
         ZjJ44ReNRJTnNsq7lkXZMsAh3GENIsgJSusrRBzQSYWq4A8IwzN2lPpYVP7i5RuTHRPl
         byIhOlQE4FqJ762KE4KeKH3hKda2kbKnibrQLUiK0C/K9iRSTgCqyhafQ/fgOz5JpKMp
         UfVVMe/8ecnIfOaTvNi+eTIa9SEb2sCtb95Qftwfq3AsHmD0mgcREGReJaamKG3X2/nu
         T6ZSgXrymfz7n/xJc41SXkCtcGx69g7kymLod4NibqMY+AJhH0RT2kOuozUkWd3vmn6g
         FlxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794381101; x=1794985901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=S3eqfBkf5vC3KW8VFlB2pqFnKP8faGFdrLhnn4FqoeermYsifBP39SYIy13EAj1hD7
         e6/5vLwwX23hK2bVksuXBLeZTT2cQnCBS1VA+g/+2IppaVdoJ+L9CNslbEoYZNi67dkb
         K1DUO9e2Z8fN956h1wI0xJCk7kx3R+VEP6hSNbpYYbHqFfn8PF9+xpbQBzs23YSLYjmS
         v7yxu06qEjxydweNp7Sxck3nE4DA78XyH+LsspPqFQdoVQ6VOtOjbHV5a5qskY+d+NbO
         SvD7it4AUZxOA6p6kjdfNWIipjoW2dVmh7DEzbrpZvnf0cQ0XPy5Xf8jIgHd/wuxtEoW
         wODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381101; x=1794985901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=tFjKA7NClCY1AThqjQ03q73xa48oIwuC+qrd2y01ZdXk0q0zCSl0SXuWr4Rg8K3ISv
         hE33Zznkk2FD4suMo7cgTYrgPE/mi44DyxP4qHoIiuDE8/PtVH3JlNYBU//CFgrhEQ+M
         JkFF8uz02uP5fi96HaEGxtejIJjsQnEedZyJkLdztILxH7eZwLUyVG+XjCt9G/pKEkry
         x9gQX1MwR5fX7zmh+RyygUOLm8rxh/yBZCyCpBE606O+XDkcK4f0T5+UUmqfelM6F+UP
         BuUf7R9kExC1vtST3FLs2QMWr9oZqfz+C/HAM8u8f7VGvfaBSc1RWIyP2THMFMjaNEbR
         x/LA==
X-Forwarded-Encrypted: i=1; AL+hErH69nsw0Xt6ugFXx+4DV5TuEBXUqPpooW9Hqmvy/5qPhgB7g3H0ZBh7gdLhOZwD59q7AbwBDRgSBBrRnroh@lists.infradead.org
X-Gm-Message-State: APuU4Z9yq/iMHcPVRWfxGu1AZrDtT/AWYMfOWfvPJ9kDAOOwoCwR4isn
	fDVGrZNk7m3kC2bAxPHNbczjfO7dp8th7TQnLjFiWhqveH7txzTRiAOTJBD3PoMaJKwtkLp5yF/
	scAfKVKoU67XeBZ6tiASuYCoxi/58bXQNF/Jl
X-Gm-Gg: AYBFou08KPnfOvK+5+EPkd8Ax2Gw57vMTkz/1c+TiyrVtUdrJbZ8/t69f0agMz5tiLM
	coz5LmE4ul0k+t3GYjEt2kK4dgZbrZ3maY3Om/8vJLRIguqYRrVp4S7rR1EeBg0qkcndXaZJtkB
	AjjMy47+9zbbtADtb3BrpCA4JlktpFDvhzQlXqOEg1XkpJXGc+2Hlp+QlJkJEMDEQpX/Ncf+rmg
	dCFvj2OQdYE+tCyJLuk6zLq/8dRJyfldZS3+KDCnzHLxZkEzoruDMxKFEfD5r6MpV/eUn5W2H4/
	PwU1sipExtCxvgF2VzBFbH8dlw5mxdgyqvZaZa9K9b8HjHR4ru5HJCBUOCrtDeWMUggN1jEYTD0
	npDfXLiBdIXSMXgi6C75+yT9d91cwnhtpUBlF+zUcv96YakRiVaW75ryoI7QOu1YaT0SO5w==
X-Received: by 2002:a05:690e:440e:b0:679:ad60:a9e with SMTP id
 956f58d0204a3-67c680f240emr733978d50.91.1794381100740; Tue, 10 Nov 2026
 23:11:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn> <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
 <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 11 Nov 2026 08:11:29 +0100
X-Gm-Features: AclHuK9fq2VWohEXOgnq_B_UqUHperL-B2npuqbYFfMCGdSky6Fm_yMTOOxsxcQ
Message-ID: <CAFBinCCwzqi13e82tVW-Je93R_1dnHvJN+ZRmqzseGJgozXrxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: "raspberrykan@stu.hqu.edu.cn" <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_231142_799925_4694A7BB 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBGcmksIE5vdiA2LCAyMDI2IGF0IDM6MDTigK9QTSByYXNwYmVycnlrYW5Ac3R1Lmhx
dS5lZHUuY24KPHJhc3BiZXJyeWthbkBzdHUuaHF1LmVkdS5jbj4gd3JvdGU6Cj4KPiBIaSwKPiBK
dXN0IGEgZ2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4KPiBJIHdhcyB3b25kZXJpbmcgaWYgdGhl
cmUgYXJlIGFueSBjb21tZW50cyBvciBzdWdnZXN0aW9ucy4KTmVpbCBoYXMgYWxyZWFkeSBhcHBs
aWVkIHlvdXIgcGF0Y2gsIEkgY2FuIHNlZSBib3RoIHBhdGNoZXMgZnJvbSB0aGlzCnNlcmllcyBp
biBbMF0KVGhleSB3aWxsIHNob3cgdXAgaW4gTGludXMnIHRyZWUgZm9yIHY3LjUtcmMxCgoKWzBd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMv
bGludXguZ2l0L2xvZy8/aD12Ny41L2FybTY0LWR0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
