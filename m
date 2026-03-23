Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F3EC01CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBbxUh7usUyfg6A9JiTvMuC1Xsdwc6qK3nrajmDEWWg=; b=asDnbYvVSqao8/
	kVf1quf0TFeHI/4fU1yVpNOJJ4d6msK+P8X3Aafvg2uakMHfRpfqFY2K7bditAV9z2Ls2O5wuMLbi
	Wkmhfi+rvxb2QMEJ5mrAIJwqH49GqNUfRXGcdMk91KWaPVpTYxb6p0+inq7c6RwuSit/SK42gN2JL
	7Feik5bmFjHw9Phz8tRq9Sf1JDmhTvRMvQZpJ66BUJOMFbIJky58naerMUw/FrU99RZJFlgEk2OrG
	PEC0U/vnNLqSNlT40co9YDyqAKdXJa8ylihaKe7f97VjRejc/JDW7CeBVGKP9AKr5oWTTFUxxw9uI
	ZItVneG/euqhNXQEHlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXe-0000000Gd7s-2ICF;
	Mon, 23 Mar 2026 11:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXc-0000000Gd6w-27l8
	for linux-amlogic@bombadil.infradead.org;
	Mon, 23 Mar 2026 11:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=; b=Pnhi/XH/A0mIw0Aj2xYc4w/oZS
	dfKIxh/oT910Qj0X176QNX9T2RL97+Kp7K9b83wK3zWTtIU0PG5y1tTeysrPoyeXnMeeCsCEMK0b3
	xQQlJchTc6HisYp825aLU2apkkyH9Qlkjk9VAvAn7uiC55OrppRqYLKZAvhsIHxq+XyW4Rr7d1THq
	LsrEXmmCSTQCNKVqQ4AoaCW1sGom/Fl+qmfscoQiD+wmjfaN4mdGboERP2Py+p5UY6EmbodgOqmUv
	V4zKIpzhh0DQv8DwVDR+zU4swhBZyCinNy+Sb2sht1bNjxHknjDSQEsEOna9lFLnQifhHwivggzDE
	xRxz1JIg==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXY-00000001OAk-21HK
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Mar 2026 11:33:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c7393536e53so1248465a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 04:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774265625; cv=none;
        d=google.com; s=arc-20240605;
        b=JJtbtX+MnxNVFVCVZuIhBiUJgL6cJAJeg0HyazazrQdKWHC8B/BKnCHGi9FDcelsue
         0wTv+VTZHxqj/3RUPsu+VwNA8ULl9wEPdd2a2MlGMSyAk5oIBtnKr47c1ZXngpplyoZK
         juuBC0wPAb8JTVnms6ebAUbyGLXvT42JrAeuk2V3dpvpcSKcP4SmO2fFMEqQDnXBePDr
         VPidJ6ZpSEVYsBH19XGQ+koHQNWjZVShQPajuz2+5ZZ1Qc1XUSC+oE9FmyA12QOeNHOD
         senPw90hzz98vdQIZuHUMMqmh2M/9NzXAYXxQPI4e7zoYtGBxfd/8hYGAEi/o/CgLKIm
         wWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        fh=34JGUnIENyOPjPeYiJQbMHdZx74zGnSokpYHyhFnuMo=;
        b=SymaxYLoMj6jxE7quuASr9L20vhZ247u2FiSdDXBznrgox+GxZXHpTn+Wzp30TCpkT
         eTMs2Yp9zSYsy0U0DLO67UITLDGuIPHziHCZQ75Nt8XMsPfbDZ+AfV8Gw405z0zVzBB+
         BOZ9ygqCQdlOn2fEeXKqHlOZvZ9tXZCauat020xdnNyFrcLwg2TvHnsoFxAWJYgQ2MMZ
         I+Sx3iygmNoh2TCldOWOne2MhOubJ8ZifshP+w/Xwz+R97sAwyRXLdmP9eKPM/RFGNYQ
         taDS04InoZSgx5bay9+ERbbUTz6j27wt0BYBH3bRHeO/aZV1g4gOaqii6xLv3JJVOOOV
         oZpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774265625; x=1774870425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        b=CtyBIReuO7tEjjO0ZfWDLYJR4lfga6Q+Kl/5U+p8RnrSH8JEIxXW5SDUTzd+okqh9W
         +9hWjsPhZAhqwTe0w7TGxwOnfjpZbQlbJLINdbcwOkp5qFvF8O864y3ClXWOFnC4jiHY
         TanudCUKayno6PYf05iTGcxBgmL+zSfoVTTveUdMBUs9/H8ju3oxYp1LVbukxdwNNqm+
         nrUVxpHlZW/itj29PTX78fEfvvwsftQhPUIbYNbr70cBy5CiEC0HG+jESgGgrn8a74EZ
         mZ/62Nh3nWdeqajtMlTQxkk9Q3J3YIFqERvfJ86Iw3guisCBXbKuWL7rXDgXR0mGCHnE
         dPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265625; x=1774870425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        b=oAfU1EWN9VcLrLuF6uJXlh8ckQqc8NFftJz7OFB00tH9YddIze7YRU20olXP9BSzlm
         snJHXeh4Fb8SOsAmLUi3Hf89F+Tq8UyaeHRge1FgwXcR+21r7b4earh69ak3dsLtY6sf
         cZko9dN3mqZHtdPCIweX7VMMFw2eED33s/FeZ9ibNtktmI6ACmZlUFwFyudBgSOAfGfS
         wvqfPwIY7p8L6+alttp9V3qK/+LkyaznJhqV8KrtlYXO48B+flyisPJJM5UT9njhP4HF
         1dpPUwhwDLQSJoLAc0Z6qeeTWdYNx5TWL3TmNr876h6T07xPKWj6whoG8pLY+pLgFiId
         cjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrV03LqePnF+m05IA5uffRFvI3jL0iJIqPaKpCaU0fBJM4gHTGcnKLrIHcV1yY0xgxNGyhkMBQba51IxxU@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDCq81bCnePhcLRuwefFzrEWg7jj/Ap+uB/IJDM0GMowMJI8l
	Fe7cNG22tPW9lZLJvJpIv4zBFqYsKrssWdvZjqQ6unFiXKUNgEFjNVWZaromdcS6YJ+SxqywlJB
	Rfh3fdWVLls9IvMebmW+4AmLAe82fUb8=
X-Gm-Gg: ATEYQzx9/txCbhsaLcStfmSNQF0IpyJ45cisjk6CN13qjufkoWTkGYQOP+a7CUBI0kw
	JBm4/P/qPlZMRx5KI70Y4YKPg/sciRN51XejPa5zOUOzFP7RHzygRgbHogEv47ErUByQ++VyRHf
	OljjFbWKmHl4k0F84WAtosyxIifpLb15sdI0MxMRHvmhb83UODZAckrLsoLyQudxLdfHGfZNo73
	VmPtqkarJa3bzRcJnC2+MkehNr4m7Ao/KvV7RpOWgFDN+PVZ9kdPftO/n8QB75VhE5smtixwZM1
	in+4PZUR
X-Received: by 2002:a05:6a21:4ec4:10b0:39b:d9f1:6ce8 with SMTP id
 adf61e73a8af0-39bd9f17360mr7025738637.59.1774265625133; Mon, 23 Mar 2026
 04:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com> <acEcJJgoaaOdBz70@hovoldconsulting.com>
In-Reply-To: <acEcJJgoaaOdBz70@hovoldconsulting.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Mar 2026 19:33:34 +0800
X-Gm-Features: AaiRm51fMHcHwpQ2lYhMbJk1jYvV2u3krU4fRyFnpLfPmI3k8CiscRrZsq0Trqk
Message-ID: <CAN4SLj0P1pAAMBbuWhbnjfwqd-5bwsNroeMzghv0P0Y_myUSqg@mail.gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: Fix double-put in remove path
To: Johan Hovold <johan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_113348_699838_39643E27 
X-CRM114-Status: UNSURE (   9.50  )
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

> Indeed it does:
>
> Reviewed-by: Johan Hovold <johan@kernel.org>
>
> > Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")
>
> While only root can trigger this it should probably still go stable:
>
> Cc: stable@vger.kernel.org
>
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>
> How did you find this one? Are you using some kind of static analysis
> tool or LLM?
>
> Johan
Hi Johan,
Just code review, I have fixed a similar one before.

Best regards,
Felix

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
