Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D17C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dM1/T3qjP4ki7dAe1LmVgTHlDyTYUSNn1FEYGCRA4SM=; b=Ac+Qy++8GhqMKe
	UwAocVHQUOF3SIAmUM9FJ4QnqzqYagvRgMN8cwNvPosKePjqlC+a8ClK2yyeTGzBLV7yJ4kg0r8P5
	mpVNPpP/59hZ4x/J/aJAL9Za846ZfLbWi1ZqxlRhvwSAv0/2SnusKGRnmd1jLX88aB484WvGZE5dQ
	7CF/XeeMNdOAHml0xFdJY9IMOtMO7FxAkPDslxJH4jFRQAUy+5rMOHLmY51Czw0Zc6zLVG5FcLrCQ
	wvryatg/6V9KOJYr+Z3bRLS9LEYwBB4F2tETL3FuIDeC/3YiKWIs+PoBYuufoI2/pnaltUkz4pXFq
	jWncrjWBGWHHzXM5jdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBYL-0000000Flno-3LbU;
	Tue, 07 Jul 2026 19:33:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBYJ-0000000Flmy-0spE
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:33:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso31781925ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452834; cv=none;
        d=google.com; s=arc-20260327;
        b=Bic2D9yDlXhxortjyrqwg2QeI6EfYTzX+rHdD1dLpPGM4ChxmLZx/tmbd/e8hBHp1r
         73pwnNIjynJOXmYvHVg96KiQe8bAK0eUwR802GNlTRFHr5e6eAQiiZsmDCpf9NKQpYB+
         SvdoxMfOmQYEF+YxLYeV05ryIDx4dXBaJ1j8D6KSPi6Dg9K5s6bYetZ3eSig/tF4P+nc
         2BPU3PipdlwFMzJ4I06WfezAxrT+4lJqMYAstvWu7PBplKbueusSmYEI15mdKRzJinm5
         o3Mu9AIrEFItvTGL6rztPYoJfxeUIhGcxecSso43muylu6EkdxG6KC/DcCtVl/JPqsN6
         N6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        fh=SBSmxfrsyF8zTjQ+5XyjoIRTCaMJsC/vBSCwwj3SZ+s=;
        b=ISh61iEx36huZlpuIOkXNno8x5TEu7thnnmubKgNL9zQ8F6PWwe9aRZdj5fhfKVzzt
         orijDrBOxRZH+w3YRFFlkrNFoqLIKPId8+0oz5JgmTczadXX0HVbZKnjHvV/LeEpy/NX
         jah3AapE87xBNaMsTfTxU2+cVodGZeSTTlOQ3MEB1Fn2Jm3mdqfq+WbRHQMHkxXMGF20
         h1EWqoZ3roiRGLpondtj8wcHv4u1DACqNdAaON30gP1na2ClRUt/MDJ4POZ8FGSyWJTN
         RxYLiLlLB8Q6ih/nAJA76Ev5UVO6wjTqFNgJHAC4rguKhFJ6AMOH0aNxXTDtD40KSTt3
         z6gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452834; x=1784057634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=gUGCgq5+TCusR+QLhid3SipeLavCLRi9cQPfcioYSBSHXlOeJDGZy5V5lJotMYpl8c
         DEFUa7TDmU9xSzvBLTDJhezMyFrLgKS72ZyUPyHWbt2UG1LWqdWiDSCOu5tllF8cqDqb
         YOYBMUwB2VRdvlprxIW7tkOmtgd4f6x9978IaWrLFAMYKiRmlDeyJT4bpW6K/uRJbDHo
         TsfL1OqA+tCfUtaBgLqrf8LXGBdMkkDMcRWQWgiiBVjROjr1+31Vnd0QfbGS3NunO9XV
         /waoQBAAKwAoWqornJ1165iJs/YCmKbLLQeceFCKORp0b+lbxrPu022MiIQ9IK3liHM1
         mOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452834; x=1784057634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=GKWirBHxQZIl52nH+c9ayNqD3iynpbhIEmMkS1M2F45qMC7w6LuNMm8IsRygfo6w+5
         JWY0uAeWsfDM+SXDg2IomWb/ExMqx8mcSfN5itc9suLoIfpBlxtXqhwHuiunPkC8eLqd
         NiKKSqlYJsXkgleXbpg4lTbnUC44vveY3x1hD0FkvhueevnyenMP/9tj0Mhb7e7KedO3
         AsWzF188VZGw65KMBxoOJd4bBlbH7eFW/cJuaioV1E0dQLsUQ9atarPUuYZ5FsOFSDsY
         kvMqDdu4+PzFy6zPh6LVlZtfalIH9jgfdBduLraF4Lj5hgLSHdazme5ENTYJXzHu5+Ei
         E4Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rpsft4tR12JhUiMNI0mhu3XG6cAEql55ZoJk+Q3uOeN00PAxLOYTzO56TqdtD31YROW+DrOmkr7lCd0JfY7@lists.infradead.org
X-Gm-Message-State: AOJu0YwGs7cKHCiLGUTX/uDacOPldsekYc7zRUk/m5LVuiZjbz3/QsN2
	1jIF0sW4WqgyAXyN9feQ1PG8tix+/dkCFLJf5Aif4MPw57an4MC//ktSmQtAL5P58OAUPFM1hE9
	JcuqalnQ6VJ2qwYVqQAQl/c+0sWl3Qwc=
X-Gm-Gg: AfdE7cm4TQmWmb5X6vtzueAH70PeSw2tu7IiPFaevl360+6no2+Hf1SoCG6ybeExW3U
	w345J4JSvSV3yR9x5f/DLPuKEuYuUqzyUAojqnJvQoN7WXgF5FN8Wp9hqtkCMbfSTClyizd0jeq
	cBlCtr5SSLv7ufI5nSkLGAiG6dBe2nz6sZTTq6IE2CygwjdYtONPJb0TjmdFKg2YLZqRCLmRadz
	keLnvvq52JSIcFkrzIQ2HILlz8FTbsL29DqchEl87PeyUNFfuXJbs1nGIV+49Vlq4FZ9bQ+Zesd
	qLhtYi0yepzs7+blKHF4HlZR1sfOkXirLLK+
X-Received: by 2002:a17:902:e88f:b0:2cc:307c:51fc with SMTP id
 d9443c01a7336-2ccbe722438mr59133075ad.21.1783452834318; Tue, 07 Jul 2026
 12:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:33:42 +0200
X-Gm-Features: AVVi8CclFQkx9s_G2Hys9qfZAMuAY5MfDBKVgSfmmojs2V4cbQk8rdJWoP8wXjg
Message-ID: <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123355_252835_9555DB3C 
X-CRM114-Status: UNSURE (   7.80  )
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

SGkgWGlhbndlaSBaaGFvLAoKT24gTW9uLCBKdWwgNiwgMjAyNiBhdCA0OjQz4oCvQU0gWGlhbndl
aSBaaGFvIHZpYSBCNCBSZWxheQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2Vy
bmVsLm9yZz4gd3JvdGU6ClsuLi5dCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
dW5jLWlyLWluIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVt
b3RlX3BpbnM6IGdyb3VwLXJlbW90ZS1waW5zIHsKQ2FuIHdlIGtlZXAgdGhlIGVzdGFibGlzaGVk
IG5hbWluZzoKJCBnaXQgZ3JlcCByZW1vdGVfaW5wdXRfYW9fcGlucyBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvIHwgd2MgLWwKMzcKCkknbSB3b3JyaWVkIHRoYXQgYWRkaW5nIElSIGJsYXN0
ZXIvb3V0cHV0IHN1cHBvcnQgYXQgc29tZSBwb2ludCB3aWxsCnRoZW4gbGVhZCB0byBjb25mdXNp
b24uCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
