Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0761061B08
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8xHJxIEy1LZRQrGH7d8ed9ekVd/Ay0zySHC7mnK2TM=; b=voqBX2kk0anRMq
	DfQ87ED+ibbK/8ZULnaXfIRzm+od8UEqY56e7Zqn6gTy/TvcMhSF794D9Yq0qPIW4FcotaKU3+5/O
	5QaIEyGAFwVTIrGiutHmBgeW2BOvUco8LfSwLzA3NAVGmzDbI1heg9yIL7kmTOAQBeNyPh/Q+orS6
	blaz3f4lt92Sbl0B7Ol9qfwzqNTcbvfqgny6dgJw6k5O0WUIT0IQTjuutNthKXT7bBq6cOk2WyEe/
	vCWgyIvA5bNxoger9NA0qtiVqDFyq1eEvPNR3q9Q5Rh2bV+IS3bFjk2Tmf41/sBZtBV0LHQMR1I9L
	GrROUFfzYBqwNbnrCiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K6r-0000000BuZA-3Ky9;
	Mon, 30 Mar 2026 21:25:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K6p-0000000BuYW-2dBU
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 21:25:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ab46931cf1so43444995ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 14:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905918; cv=none;
        d=google.com; s=arc-20240605;
        b=jl+JF1XXhoDE5dezFTmRfBUpoySGbGR7rQBERcLAqMBilYCJh4IDEq8uCHMp64/cYl
         TcD7v6obc6v/J1tiz9wUkfYC0lnuvJgnS4yGiRzuCiJi8fK4A4WMF/bucSDIQHlA4N21
         vnTUYnLtBturMMJB8CQ+B+jZ5EaX5pM9rkwRcYjFRNQL8uUo1f2ceLb1wd+RR7sWKERA
         AYs3mya4NZyEgUoAo5G3HRe0M+Rrud+2CvtpN7+2i49a033AGqDsSvkpH04gf8ZQ/cy1
         edM6g4/e0zyifcYflqtSwcbBWMJYFLZPXVa+3H38z0CV9wSEDQx96gUQOX6kxiQeG+P8
         Ji2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        fh=YCHiyY7LdbPXnEpgB0Tbk+dLbc06b6xq7Q/a1TP0SUE=;
        b=Trq8gmvXtA8Xej6rXNzTumVbFTuK7+4uGK2wqpYYDyyPbPNoVsgezNYX2Q6isD5dSj
         43kk8jhEzdEHC1CiBv4hLz/+hzBp9BNxTjhQo1K3jMIzUPHQcY4vhN7sihGzkrIYlTGM
         cq3+BQVz8RIQi3GRf0YnIqfeGaIgstKP0fBtLU+iM+LrSa/A2pEC0ZQ8P5yU4pRfcoXp
         UOdPf0kZEzk1Aga07RwRba3VeZtWI6xO4jJnZ595etzC4sjfS3EfyOk9pc3UngRL0m3L
         FS1/k8hICRjRHFn2kiOoqC4T7YNMVPf7RUrQbpPfdZfbI+m0EHyQ1J3/BNBUYOEyidHf
         kccQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774905918; x=1775510718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=aEDhtkIerONWml5nFesaoRv426rqJ4vxvWvbfexuP5XZz+GZV6gkZ8OqhEIiubZU8O
         50F7UpgVbPi1eo16ljEACz1lO+g9E6vETIXvrRRWZ3Tc91H2eZqUB68hxvmUvnSVRa5+
         eNi1La73ZIuXqmDP9CoqWyUKRiVhzXtkdy732SPralQPYokOkNqdSudUAwYaml0CMbwS
         A2XmmT+46sMDCTrENKpZ/8Qblg6iSBPNRRfiDNsJjRY4+AvwZTpUENhE1y07RlNGG3Vu
         DrRSXltIJ4/rOCJOiy8Fqd98JDC8ltyTrcmizggk48UZqHTRcxBA/I5eMxgd2lbS1xsh
         sH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905918; x=1775510718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=lXB9qGi5UPh15eytmRZ8PGw1Qc6nVzvbB/glr/36eSUaI9dXIEIWAWdo2aeUtrWixm
         6Mhsf2iBk54voLwzwuXkC4CuRLXgPqhW8KjjnR2R3FyPTdGK9Q90J2dia6aRautxn1dY
         qOcJ0vv3RsnAFWnHy64S9YDrC89f86gVDPNDRG6vG5QwfOTuLemEWN9mvJIb+nkruxYf
         HqjIBMZeldeQ4Ic8ZNCeuLIyH8e/8sfLqhmTkdvM5QUqtrlKxrQZr4BlaSMDKZdjIjZi
         +uTDOGG5A5pfsLqlfAysncRgbbP6Y34YI21O+pYd+o5IOLHEYHBtk0o5KUi38mKq6aMx
         F45w==
X-Forwarded-Encrypted: i=1; AJvYcCVx8WSZXQ4YnezOmRv7ujAk/1W9nAx3F8sjQrj1U78K9azAhXE/k/gSmtVM/NIvOuPXw69X+hhUYNIB4g9y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw9hSDj8P/yT/l+HQVdeePe2fQDtlWYbFjMaoR8gQVn5vc6vEy
	cMjBl+Bpd9oRUfy1hnR6d6tE/MIvcucZqS6Ug/RZ/a+B1LUtSdmhXmhk9CuY7xvqKe278z4G3y5
	Rpyc0BDUKD8O85Df+b98N2p0JLT3ie4U=
X-Gm-Gg: ATEYQzxYlYoUlhwb33etzO1iBaRUmOvpTTk5a7JKSM0biRtfGcbV6PPAVel7sMJJX8x
	CczrTCdnGH6ZPXkDndiCK8SHaVy7bNIrj29WvE7LUtTRXIpLzvt6Wwmafm4xMM1BAIWRlnFXbC/
	VKd48FnpqqhIRbzSdPFNbBPn9vE4BbPCp0mfF9A7xLt6V0E1P02Qhk2stDXOPJRzLOreDH0mmXG
	PF+kSkSNE3MI0HRRt8BOHkTcBD3yWmkw1kbIogtSnqSIfcT/K79Z7ipGDQjItm3IfpP1B74j5+U
	h28u2ZZFTvHVK7Wx5DNcPO/w5PDoNIQjug6qPjzS
X-Received: by 2002:a17:903:ac8:b0:2b2:5070:79 with SMTP id
 d9443c01a7336-2b25ef3a597mr9046465ad.18.1774905917931; Mon, 30 Mar 2026
 14:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:25:06 +0200
X-Gm-Features: AQROBzD-B_vEYsIVR0iEnkiRzA98GHw_jcG_pPIvLF9KA5m8ziV-gAP2mWQJyxA
Message-ID: <CAFBinCCOXSKqv23UVKK8W9JxhBGfajyW8_rvkaak62LiRBvUSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_142519_670257_13295385 
X-CRM114-Status: UNSURE (   9.97  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgNDo1M+KAr1BNIEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDb3JyZWN0IHRoZSBpbnRlcnJ1cHQgbnVtYmVyIGFzc2ln
bmVkIHRvIHRoZSBSZWFsdGVrIFBIWSBpbiB0aGUgcDIzMAo+Cj4gZm9sbG93aW5nIHRoZSBzYW1l
IGxvZ2ljIGFzIGNvbW1pdCAzMTA2NTA3ZTEwMDQgKCJBUk02NDogZHRzOiBtZXNvbi1neG06Cj4g
Zml4IHEyMDAgaW50ZXJydXB0IG51bWJlciIpLGFzIHJlcG9ydGVkIGluIFtQQVRDSCAwLzJdIEV0
aGVybmV0IFBIWQo+IGludGVycnVwdCBpbXByb3ZlbWVudHMgWzFdLgo+Cj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDE3MTIwMjIxNDAzNy4xNzAxNy0xLW1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20vCj4KPiBGaXhlczogYjk0ZDIyZDk0YWQyICgiQVJNNjQ6IGR0
czogbWVzb24tZ3g6IGFkZCBleHRlcm5hbCBQSFkgaW50ZXJydXB0IG9uIHNvbWUgcGxhdGZvcm1z
IikKPiBTaWduZWQtb2ZmLWJ5OiBKdW4gWWFuIDxqZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+ClRo
YW5rIHlvdSEgSSBkb24ndCBoYXZlIGEgbWF0Y2hpbmcgZGV2aWNlIHRvIHZlcmlmeSB0aGlzIG15
c2VsZi4KSG93ZXZlciwgaXQncyBpbiBsaW5lIHdpdGggY29tbWl0IDMxMDY1MDdlMTAwNGQgKCJB
Uk02NDogZHRzOgptZXNvbi1neG06IGZpeCBxMjAwIGludGVycnVwdCBudW1iZXIiKSBhcyBJUlEg
MjkgaXMgR1BJT1pfMTUgb24gR1hCQgooYnV0IG5vIGxvbmdlciBvbiBHWEwvR1hNKS4gU28gdGhp
cyBnZXRzIG15OgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
