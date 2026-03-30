Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C3D1061B22
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 21:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vMk3UvIcMSywbmQpG/8DyBuEqt7u77dHWgXvKDVU8o=; b=jvbfKv3g3bKC3y
	ZVA4zd7ErV/wSk+/DpKqWTJQVSe5OyPWb8n4//FYHI8CiZI8dnSjjbpwSRA+LcKwl7AltBNgh9m3s
	b9r4KUYpXrcWpx4ayOzfLSUUUNO/mMSrT/lZtP6ZKUK7hC8tPNqOMdtXshZIViW63dgWc9oTh1jlm
	GhvG3X9lMbghKkejK2tErWrShFoVQjbg+pvUpNR1YCwqw/6aAFPlrDXec12OL3gsq9K30MjtFHKjj
	e0+YoazmjxzzniV5UliFR5SFNhTnloL1ZUgJTRbKZyV1EFfh3Cor+7UeH1bt8gCcxvb1LFJBXlpG4
	9r9yjdocKQNrmEgLg1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KSe-0000000BvZr-3u00;
	Mon, 30 Mar 2026 21:47:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KSb-0000000BvYd-1N4N
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 21:47:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c742882d2a4so2086659a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 14:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907268; cv=none;
        d=google.com; s=arc-20240605;
        b=XdvQeMyDa0TuZBdxt9QimGHHzWiVTtMKZKeZeKqdx8PsL+msKVCsvwp0MFi813jeT5
         o5aXP88MDs36JIJh0zk0TLBbm0Z2o+8kNxS70ouQ5IsasJiOECpCCP+/sOBSlFQhweo2
         u3lPpTcZ1fnVsWOVfruNqZU0Fefct7BfA62+BWmi5fbEg3P89dlwZzxDccaoqUF431Ir
         aGN0+E3zWX5WTrfAWaee3nlCReTXZ0MUFH1RO72AKslXAsRGfSRllI8bJgd2jf+2IPyD
         HKn65LnlZMG0GdfI5zqegYfwxrqcc1m15WPKVmQTBnkzh2Jprx/FM3o27Zyxc6nPd9ns
         qCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        fh=8I7j7p2cFVMf0/QxNHSU9o6QJA/h29k3cKZTX6IClB8=;
        b=RT6QrCPetIVlcoPUlt1zqMUVSUw3HC/gST0h1ZaI5ibCVfmL7W41EZFUQ6OcovXzvP
         UaKxKuzM8mfe3dgMTrrTg0hR69Z/6tPVocollDuy83NC0xXSk1bXGBCGln9LmmmHzNJ4
         IGicSBW1/ANBVre9zq5FuDCl5PwQa7CJqgpvqKq8AlSdl0612WBc1e55pqzaTjEUScss
         iLhTuOGmEG7IVMufR1Ve/beOGgaikkXgDBQNzsFBUe5AEGLrUYTv+NheG8UEWunWq9Ch
         4AvAgKMuLjRsJt/O82RJ693oP7Uvosmn0k+7kEc4eKjqWgAJiz6kPwbA9CECf5Ea5MDh
         rptw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907268; x=1775512068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=lzMQmYU7Spcj19ZAUjUmurLh5S3ojLpPTG5C/5O6zErUCE5FvdjmwmAAeuz2+2Hlp5
         wl+/vfyjzyLV4guH/5qM5lueoCZWiq51AZHpq1kVM7ZvPmLkrMgjBIetE9a/ZDAMefwH
         9F2+gbVXF4b5obukt4jKTTIU+Z9rwmA7s54ec/0CusFyJ6VIlbUcsJH5xe5ceTUJdNoD
         4M6geoPOVeTGLkFBBEb15g+nHM7YbxrvaUzOnPMQceaRXFRP2F8sbThFfRi8W7uC6Suy
         Mky2ypbEv15f9TuQO9qBrNZPeS5kpy5LzI5FPgvg+NLr4M8jwnAjt98NRlmK66STv+bc
         HlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907268; x=1775512068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=Z7+zIDWSz3f8EmotszCMRg/x9yGpPhqGKX0+HZtD/xK76/d5uD2htBAQOiLcHW8Pdv
         euOhqFQXtuVTU0eF/kuybWOHq/f1ppecxJkhE3QtUAuj5xrUloaSgaeJjEKw/ZknNtEN
         ebVNJZjvI3KPJvyjCDyfXjVop1vYbtGUGx7f7WTkAjb9fzCHvWz/HYFjCNXcl2M7uXiG
         1qxHNUdVvzIoFRFor+vJmXwRlajTgZue6b3dH7dv3JfE2PEWD0jqEDyg80RJOQUAE0HN
         xaCGg+lxSClLHzh2QGyIYEdYdZivBxe3O0DTIFk6bJdhzc5FZ5sTmECWEWhYRO72dygf
         LtBw==
X-Forwarded-Encrypted: i=1; AJvYcCW/iluasDtK++ui/5c5iymkF34uv4dj1/XbuOciH1tq6Hc5UyXHdsoHZKPDot98ecmYQQlDNHdXPydPAB43@lists.infradead.org
X-Gm-Message-State: AOJu0YzMIzPpsXjqlNG2d1AO6GdTMnwYnsd4SIOFdt2rM5Fk60nqrXcl
	o+k1+Gddc8d8S/h/V3v39aJiklbFCiLqgjxIp7VYCoYtqLvw3DTV9jVXLk0z8VW14URHzDxRije
	ZKLu/1/pGIUyrjlPzQeksN380vqyG21o=
X-Gm-Gg: ATEYQzwQxDhrLqai/wtrpOCryRDuRR4Y81EQ14EHdIAiBeycaUu1aCVIUEArC9+ZFF4
	22KfL4zv+he0SPQBEcYHpyNCGVfLpeRDNFSiHQlML7Xmx3ip3Y+Di2k3gmCBjBXzTAyA5KFcDLv
	d6nYEcgjsJUF6V3viKmdN9JEQrT9rjtVCalWC0I14M3bOPD0F6CB/sjs/TDnvsF/FzTFTJxEr8M
	lvqT7aI+bmXpsbcEFdUpUR1qnayXE1R7EzGOQruD9TbqVWWcfBMIbRU+ru54OieKGtzEEi6MVae
	0a6ajPDOWjOHS2ftCtjw71CNFnkiMuC70Ei6poQP
X-Received: by 2002:a17:902:ea05:b0:2ae:c816:ec5d with SMTP id
 d9443c01a7336-2b0cdcb047amr144282745ad.32.1774907268370; Mon, 30 Mar 2026
 14:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:47:37 +0200
X-Gm-Features: AQROBzBvnmRKRGAIvSjOHMEU9BCTQO4Sy6Oph-BgTLAMA4eX_eDJ84xw0oCF39g
Message-ID: <CAFBinCAxT3Nz4VfJZWdvE0jPN0J0Ux8Q6NQrD-uCv1ouhmMuKw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_144749_367975_F07A6810 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgMjoxNeKAr1BNIFJvbmFsZCBDbGF2ZWF1CjxsaW51eC1r
ZXJuZWwtZGV2QGFsaWVsLmZyPiB3cm90ZToKPgo+IEZpeCBpbnRyb2R1Y2VkIGludmFsaWQgcHJv
cGVydHkgZm9yIEtoYWRhcyBWSU00IHNkY2FyZCByZWd1bGF0b3IuCj4KPiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRiOiByZWd1bGF0
b3Itc2RjYXJkLTN2MyAocmVndWxhdG9yLWZpeGVkKTogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBh
cmUgbm90IGFsbG93ZWQgKCdlbmFibGUtYWN0aXZlLWxvdycgd2FzIHVuZXhwZWN0ZWQpCj4KPiBS
ZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYwMzI5MDgyOC41Z3QzOTN0
Ni1sa3BAaW50ZWwuY29tLwo+IEZpeGVzOiA2MGVmZjc1YWM2N2IgKCJhcm02NDogZHRzOiBhbWxv
Z2ljOiB0Nzoga2hhZGFzLXZpbTQ6IEFkZCBwb3dlciByZWd1bGF0b3JzIikKPiBSZXZpZXdlZC1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFs
aWVsLmZyPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
