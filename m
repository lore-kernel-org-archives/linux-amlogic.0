Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4741E9B36A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYGZtcIun92xh2lwtx6ypWPKBY+U7bBeVm4Hk2KMwPA=; b=KD8Q1iNWOvG9t/
	v6BJV71UKOzISCEW1U9Pa7bRYiPTixA5YhkBS9MXy7AZVUiTHqpjJ7JwH2sYIC9tz19tSq7ZaDC3W
	BiRwZzo6XCgejZlU6foBrTXgEkuH5UqptjCy0iGTluBVdKX1gCyTcTWqMaCmzFnO3MlAJQobucaXO
	A9s2IdI4eoBFInXiHMN+jwGvtCHghiIYwXZU7pgDB9D18/zAll1TDLA2/4VZQF/i4P7e7FZyUAC9t
	YgyNQFiDP04IxFhpX90CYskaNhf8OUPJDd+2sJ8MWq53lNvtTuT5oS3aS0CHAonDA0+zvrkyyarH/
	HFrMrTroYmgYHZ6o3xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1wy-0000000CtVy-0exi;
	Mon, 02 Mar 2026 12:00:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1ww-0000000CtVJ-03Tp
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 12:00:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso19914655ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 04:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452833; cv=none;
        d=google.com; s=arc-20240605;
        b=UtXZyvR8TRR3WmcTNJ05q5jjzwPtaXkdG0o8brfsj/me2D1FbyMkbFeI7mLTl8nkZZ
         f4Yj1qM/+QnRUw82sJu+1ZMlZpjdzg9fQVUb764gY7Ruj7C1qqQKfxX+pXAFBqjGaHJz
         8AI3KvBvt11RobYPTKfrBaKnptQE935yli9ewFyXmR6oYbmnxk8JmUwZBU/uC3qczZUR
         mOAeXuHMGMvSiBu4Esdng+/m30S5Un+0G7OuggpYU8jZ72CG36/OTJ1RGI6degpZ1P/P
         UV1/0k2ZmevOyFxmvb1JMnczcKUkILCDKBtQKypSrkZzxaEUjmDFFLX+78e3Rghv1LiR
         YKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        fh=n3Wu8WLabzFqFS4dAkKfLxHY2bAndackXuEZiZNk2XY=;
        b=B1LkgBhZgZpnDzISijwfySsX4jqLnCD5hutVF+zlyw+Sz2IjRFv7+mo3S3XVDAz1PI
         ipsCi1SpMC+HOMZvPD5yYg/vsQMGyNCK53TgOFdE6pOCUXNkWNF58xaZ27BfAfJOyWtU
         IB+RPHxR5a/vM2U/8HPa9VaX6OgMM0fAqdnPyOXS8b6OhMnozp+dA99M2U3SxI8z11jQ
         gjEwgPsKew2t1hV/jWvekZP6qapCqyTb6joy9GILVJ0c2npnVm74PZUQKm24yHg7fEZb
         O0YraLcpjr8e2BxAX5y7IxdQdoO7iPmUQtbCYJc2ZxbpSev81z8iOl0Qx1CS0YkRwUqS
         OMTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452833; x=1773057633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=axN12TeZxHItut0/d5wBFt5s5Z3FA54T2Je7F0It48TkioUUuqZ4uBTVih8/z9zozF
         90iZouC30PAMP0hwam57YytZ937OhXco8krrIIOnTEFeTkfvX14wMYwFUC5XF5B9Yno7
         rUnI4K0PRtmsDSlD85rUnbT+J2vHz3+LoOd2sHLeQK1oiDbNL9FkF4imVeG0EJ0fAx5M
         hVKUgiOVtYx0RbOaVDE8mccIGj8WkJFuIIjQ3MhWS5luKqSTGyJGZFtc/TsWdEOZyIoX
         HAigrJepgrJ40Xkrf6nBcaxpAjFPrmxAZx9NJYdAczm+7/sf0QoKsUdYO0OcmthAkWfD
         WuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452833; x=1773057633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=u+7S8jbjzllyxdFWV5mKjRgk2GUWC2pi4s7t9aNzhExOaMXoAqtbpuXikCefl87cb3
         g2OS8ZGo6iiA7bSLBED70aKlUMyoTcrAHmnU+wB2ev0rUMet3+CoH61Qc9bYmUZ8R+Y/
         aaFU2pzqs4+pedG9sCOcZ3BvF3vqpsnn+RZh6RJ0DDO/4S5Ey25nLIhJJxxiJI6fcktg
         y975NPDjIbejFBy7hLOoqriSObZyZDf0P+sPeRotk/kTI+vQpwJjOKxp4OFsQmb4lPiY
         PXfKG6FzuIf1rbHDaFZzREFJPDbU9eBZ0s3qdJVwjXztQsW8VJjNsfY/Q+CFDAvc3BXL
         YF3A==
X-Forwarded-Encrypted: i=1; AJvYcCXa4aufxAmMv8NSs7v+FoTt0YmbEq4afOmyXoMLc7Wg41XzMt9AP2eKExHAtICvPFzr5aCZrLNj4TQE+NRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2zKfU+WXAU7WigJVz36Gd58fhZVLBOmoNVvPysFnIYdelEgV/
	u0WTqX1h2eLCDxye8gEQyckrtuAQoTCAjg6HKdrK0zm9AnLJn/kLEnn0QneO7kvxHe5JuDcwl5Z
	hB17nrE4Iq8IOGaT2M7ZpyoaSsMM/jus=
X-Gm-Gg: ATEYQzw0mN0vlEcd4pGMz5fNYLS8jvbNMy06eIhNyPInyBRhwxDbt2B5uSJZ9b5Jysf
	bCsWKQczzXHcjt5sLwTZ/jH1+a+eU9n7K32yakL0FxnQosksVbVeZj4fLzCfLqS3RYjDxid6aKi
	rUyNYx/NlStrocFdnF4bRwVvdL5DElYuhfWe4SDRQ9x76bRm7TBnrl3IPinoZL3rhFc/Rtk/yva
	U96bMR03Xtkg0nQqoA2NGOu/rFI1cJpM1YabZQ/vsKYkFCujWqRvl7bcxHy4kWvZu/KiZkTXqvZ
	4qPOtDKxJVq5lhz+ioS/0J4h1JGsQVSb9DKMKHYw
X-Received: by 2002:a17:903:2b0b:b0:2ae:5a44:ea73 with SMTP id
 d9443c01a7336-2ae5a44ff28mr9115965ad.30.1772452833138; Mon, 02 Mar 2026
 04:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-5-nick@khadas.com> <202603010009.VfPuPoeI-lkp@intel.com>
In-Reply-To: <202603010009.VfPuPoeI-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 13:00:22 +0100
X-Gm-Features: AaiRm506ikB27OOPsiZaHy57remzQl6Z49Wi7FBnTFU4vfPVcSRrRPvLCZYsf3Y
Message-ID: <CAFBinCDBR=cgQjhv9VxYLFAmTp2p+Fm_mWCZ5o5P_SA=Rb0R+A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: kernel test robot <lkp@intel.com>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_040034_075092_4F1A2C64 
X-CRM114-Status: GOOD (  13.91  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgNToxNuKAr1BNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIE5pY2ssCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBub3Rp
Y2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3JzOgo+Cj4gW2F1dG8gYnVpbGQgdGVzdCBFUlJP
UiBvbiBqaWMyMy1paW8vdG9ncmVnXQo+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gcm9iaC9m
b3ItbmV4dCBsaW51cy9tYXN0ZXIgdjcuMC1yYzEgbmV4dC0yMDI2MDIyN10KPiBbSWYgeW91ciBw
YXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBu
b3RlLgo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJh
c2UnIGFzIGRvY3VtZW50ZWQgaW4KPiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1h
dC1wYXRjaCNfYmFzZV90cmVlX2luZm9ybWF0aW9uXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL05pY2stWGllL2R0LWJpbmRpbmdzLWlp
by1hZGMtYW1sb2dpYy1tZXNvbi1zYXJhZGMtYWRkLVM0LWNvbXBhdGlibGUvMjAyNjAyMjgtMTUw
MzQ2Cj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9qaWMyMy9paW8uZ2l0IHRvZ3JlZwo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNjAyMjgwNjU4NDAuNzAyNjUxLTUtbmljayU0MGtoYWRhcy5jb20KPiBw
YXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjEgNC80XSBhcm02NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1z
NC1zOTA1eTQta2hhZGFzLXZpbTFzOiBhZGQgRnVuY3Rpb24ga2V5IHN1cHBvcnQKPiBjb25maWc6
IGFybTY0LXJhbmRjb25maWctMDAxLTIwMjYwMjI4IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8w
ZGF5LWNpL2FyY2hpdmUvMjAyNjAzMDEvMjAyNjAzMDEwMDA5LlZmUHVQb2VJLWxrcEBpbnRlbC5j
b20vY29uZmlnKQo+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDIzLjAuMGdpdCAoaHR0cHM6Ly9n
aXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IDlhMTA5ZmJiNmUxODRlYzliY2NlMTA2MTU5NDlm
NTk4ZjRjOTc0YTkpCj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2MDMwMS8yMDI2MDMwMTAwMDkuVmZQ
dVBvZUktbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCj4KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBp
biBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9m
Cj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwo+IHwg
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IHwgQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYwMzAxMDAwOS5WZlB1
UG9lSS1sa3BAaW50ZWwuY29tLwo+Cj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOgo+Cj4gICAgTGV4aWNhbCBlcnJvcjogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXM0LXM5MDV5NC1raGFkYXMtdmltMXMuZHRzOjUwLjE4LTI0IFVuZXhwZWN0ZWQgJ0tFWV9G
TicKPiA+PiBGQVRBTCBFUlJPUjogU3ludGF4IGVycm9yIHBhcnNpbmcgaW5wdXQgdHJlZQpJdCB0
dXJucyBvdXQgdGhhdCB0aGlzIHNlcmllcyBpcyBzdXBwb3NlZCB0byBiZSBhcHBsaWVkIG9uIHRv
cCBvZgoiYXJtNjQ6IGR0czogYW1sb2dpYzogbWVzb24tczQta2hhZGFzLXZpbTFzOiBlbmFibGUg
TEVEcywgS2V5cyBhbmQKQmx1ZXRvb3RoIiBbMF0KV2hlbiBhcHBseWluZyB0aGlzIHNlcmllcyBv
biB0b3Agb2YgdGhlIG90aGVyIHRoZW4gdGhlcmUncyBubyBtb3JlIGJ1aWxkIGVycm9yLgoKClsw
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjYwMjI4MDYzNzUwLjcw
MTg4Ny0xLW5pY2tAa2hhZGFzLmNvbS9ULyNtMmY0ZDMwODc4ZmM4MjUyZjg1M2JkYjMwMDUwNDJj
M2FhZDk3OTYxZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
