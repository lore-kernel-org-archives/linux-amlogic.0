Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC97606A331
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pqOFB9lq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=yJXNFzf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4FuhLxUkBdVVFtuPdBGL5TxlY2dq+T4gmHO1I8Iq+cY=; b=pqOFB9lqDeM1SljxwZM+k9fpAe
	ZN6LVsu+MPnXoOLlk2tyI2xs44mc9c+sqwXRa13kqMUO7FDSLhiiCztiZS8xjQF43YguV1b7hY1vg
	daVqB36gpNkz29Tlcl4NqQ4cv7IVX4MFcBy83yl9rWlSZh15Z2k6QFqUS7p8GR4wOdyPoEmT3Qf2Q
	JcWT5Gg9rLipzVievhBDhzv77yDJVJ+D+B5iSnKfZR6oa5QxZrzkAFyXuPiY6haIqaRd39KrVLdFA
	+FDnVNES45wHNDk6HX2/2Wiw+KY2TbPc/R7Wc11ImI8IpebiFtsyfC8uU/S3UTFMN2E3QsJ4+fiRO
	JFcM0YBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg11-00000002lgq-0SHT;
	Tue, 10 Nov 2026 07:11:35 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0w-00000002lWn-0fWd
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 07:11:31 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67921b515a7so1814124d50.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 23:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294688; cv=none;
        d=google.com; s=arc-20260327;
        b=NeWitnIIZ4grUSNTaw/JhX0S0IJX6Fb/t1vlqQWClISGM8ZT7w8vSnScs0jGAk+/u2
         gQjyzSscceWq5UA7wusKhPbWzsbqwv1dXlJrxz2m4A9D7LOGnZPMX3fdXWXBUWC/Mwxp
         FzjWOTlulRmyWewqOPIcu5aACzyfbF+sZJs29xQNPVSUHDiZOKKuoy6oiG0LN7mHzgsA
         1mrs54Fuc1TpjC7aBA9Q/IL9vWmvqu9f97Pg7nbpnc4TfbcqGojfkkUN3hTcFtE1n1z3
         faMv16mVnRjXWkLjq/3Pzu9iVA6MB1hITB3zj7yDkVCdbEnBGsqyXmvdHqZEYC/ij7/+
         eGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        fh=aQB11a3e2sOUydaz+xRbI17VUTJPQK0Bdh2x/i6lZwY=;
        b=GflRvmqq9WE+ObdGrtClnelq3eSQgtP9bJ6hTUXdbhxlkSBySwbA2GePGkwtCXdprT
         S+TG1xxM5+IFAKf4tEzOr6t8exK0AalamBGEs56ajM8w/AE6xRp6dMSZz2iyHY2K5xpF
         rKF9gipeRVvdar3+R2GIIp8Mk0zymreULz1GVNOB2YIn7hYg+EQ0kq9h6ldPCetqQ2Zx
         OqQMyA/WjfBkZHQ85r5u9h/zyq+mxg9ayLQymo5RBdUvDF6ZAyv+I/OW8v3C7pwFU7t3
         C1QZ5yfs1LNtTIstxmJgwGwcmXTiaQOFAbdaQrqyeAPgT7Sp8bQqiRZA1dNT0NQtmJPp
         4Tkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294688; x=1794899488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=yJXNFzf3wfO851HyXeV8Brltmvx0O1RzMGzQIifqAy3NQzdG5Ha8pVo2uwIBpCM2+N
         o5ZmpdPZzrksIkUw7mmgPtwlAekiqF4VxiR5C7k2b2xEL5triq7Xqc6Jj8mZ35Esk++B
         dz4GxGqbjKyV4NrtxYuFkbDf+pMy2HSPz02v+CbpHkQ0AaRBw3YWw5IVP5eVNJNxunvy
         BxSWQeagpL8WK2IKZrKjf4URWVc7W7F8TRWu8nLoXlMWDM26WwOGXmiTznl1wQK8TT6q
         jLOx/8CvJqRmMq49PUMGeii09jodX6E3SaDlJXxi8g0HZwptpDXn5b9H3GVgwE5gMLqr
         k1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294688; x=1794899488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=o3cewzoMdTrH43s1GCW5+Ku4SAKPFmsHMRPhNzWNV55g6GsGxPeyuaPAWzsARHDBbe
         rC4yoZlGauU9w5La1PxrybPAw0mlMFlc6XwDvHloDfVxmwdECnlxh6ng9ccwYXaauSJ+
         xkh5pMVE5FqhOmbsn/a/gxK/jgE3GO+0tu1SS/lYNPC72IMHLz05T8NGMC5Vay+IwMa5
         9XLzfOA02j3XOiUvbJqXNtd7Kk5aABinRFw60MRcyFqlEPXPUvtTw/VdAPd+bxxFAlMy
         goUWo5oE1VRueQj6TQjpqGrrbYjRkbxcQ52hwQoIbJ9yUiDTIu778NAslBgHAveaPeyZ
         Z53w==
X-Forwarded-Encrypted: i=1; AL+hErG1CzNchImFveEBxwOCL2gck2aSjZoXUUyz4XCPCz3Tu82uHcdN/DoF6Ip9fZQDeCn+czCaWhqmD+raKRGG@lists.infradead.org
X-Gm-Message-State: APuU4Z99GaszzxaCq1z/XTXWiO247ogEXWPnB7g0288FSXVTiyGMe4J3
	FGw8A1vJ53SoJUl4uykLLwb0uDADVVPWJMreAKnWRnL16prET1CkvHXK1uBOn5kil61PJfnzWsf
	uXxEMgXkjDM6gZnZJaVl2Bxb6u1uWwac=
X-Gm-Gg: AYBFou0ZbGVK0GYG0jFHrvxc84zuyHGv6lYEYqIb2iRmlEDdBZPZxUuCi+RMGLhvCM5
	yw/zqcdIpi80HD9OOBau+ZrtLI/IpaRVSSVXdXCPh3QwgqurrRNHTj/mBYGvhF/wFrUWNIxOrwp
	IEfSusO/DzzjhUJW4uuEfHp2bkyWNQTj8OrLEW/9kuf+Iv+jkGoDSOUAn6gA5sRYv185lJh38ye
	Db3RLqly1Iq9hHRQq4abAqYzY94cTG3+r2QahJX9Vd1lJUU0lzdNd26hb4jF8JGpQ6GbvEyUI5J
	UE5f44aHizZToRDZKWdwmbzDijH/tnkxwbn5zcOEY2n/ha6EnPJjAbBh9lRr6BSt456/ZjQShev
	LxN0KHY9Jg9c9cr37w1uW2SJiR80VLHfHpyAa
X-Received: by 2002:a05:690e:480b:b0:679:c916:46ed with SMTP id
 956f58d0204a3-67c56867600mr864381d50.65.1794294688510; Mon, 09 Nov 2026
 23:11:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:11:17 +0100
X-Gm-Features: AclHuK_6GpTQ67xpDENQByDg8QRKTv0ORuAztrJZSqgIK4qf--6_2HTmK0qNm1Q
Message-ID: <CAFBinCDi3m0gMTQBCd-yrCfAKkT0QeuXq0wE_i+CfCtS2oX+yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231130_207137_FAD14F14 
X-CRM114-Status: UNSURE (   8.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMToyMOKAr0FNCjxjaHJpc3RpYW4ua29ldmVyLWRyYXhs
QHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSByZWNlaXZlciBjYW4gc3Rh
eSBwb3dlcmVkIGFjcm9zcyBzdXNwZW5kIGFuZCB3YWtlIHRoZSBzeXN0ZW0gd2hlbgo+IGEgcmVt
b3RlIGNvbnRyb2wga2V5IGlzIHByZXNzZWQuIEFsbG93IGJvYXJkcyB0byBtYXJrIGl0IGFzIGEg
d2FrZXVwCj4gc291cmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2
w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
