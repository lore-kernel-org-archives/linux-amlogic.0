Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36567CA6017
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L15B0ZeNFOZtaPUlauVuyuRY3/LW7EOsl37b8LRVrjQ=; b=CmwQeRvSAo9/Wz
	VHDspEKVa4WWkmWRvTpqF3zy0rrYXEEFiPFZTpwcBmmEAmEZZI4AL7pD6RRrs1cQLlddrKJ8yxV7X
	2qJ8orgwXyQuFfKVEoOH9yDNHoXFlKbD95HcVE0QbvXg2DJP3mQw0KKDqeQ6EICT7U/QR8cHXA+qR
	TUXMQq++03euwiy5dwKUQsh9zQU0WLBhinF83zmSqaK1zSrBL+f8J/buQIfJgCtE5MEY9M45VgNwf
	ghJS375/km7J8t+MryKYcJczVwkUH0lHQkdYN3r6c+KFo1vWXzmf/ix2R6XlGoFHy4KXdNcUSJ/G4
	OmU+TXSK1oCk8Hyz8Png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTys-00000007oxC-0Ci7;
	Sat, 10 Oct 2026 10:07:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyo-00000007ouv-2Sob
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:07:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso267540f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791626818; x=1792231618; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=fGoylwPrjG7NS2WCJiM8kJEHodZm/d5uVBitoCY9gfru9WHh4I2tjE9LnzCmDZZcXQ
         0qiwi51yDRw9lbvpgpKJrojCRLzLCckDED4/TlpN8yrynEYa8lPF+Txs/h2+ZgtYAxo1
         uDrrwt8mzicKr5XBudj2qOPvm2dVoI/BCMcXMsq/67RP1AFNF7DBUFpHdUxf5O/m4fKw
         vvRrZUypI2mE7T0R+SIMXGwdVv3rAzQt4qF3RY+8yShzMwpG6V75yQbVI3rkiCBlQOe9
         yKcxhGUmC02GAA/IBonTjZ3Oo2HzHQ+rNXuXnFA4+W+dPHteb90bzOyO01N4kUYp/Ly6
         JMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791626818; x=1792231618;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=w7zNixc52HevvJG6BWxesNiDFb0gO7ut098/6zbnMt95H5kMDdNg8OAteLPZPvQsJo
         J52D+wOr3Q/+dmAkFVDhF9vy67zveSIIpoaAV+XftJ7JU215X/7M3OB2lu0wIxe/Bk1t
         jd++uZwUlJboZssOXia0B7dJKKItyh5dSjvOoDdc2+B+OvMsWfoeijAg6v0knAmVKmZZ
         Rc31UHhzUVd9D6Rjgk3aUM6XmZkRhi2yvclY2W1u1z3ujsUg2Ht0L29/Jdz/nmWj2+Sv
         KP6rSodTc23J13iZezL9pQBOsor2m/CV0k2cW0GisFta12lXqWpbobSNMexcLghu4X49
         mAjA==
X-Forwarded-Encrypted: i=1; AKwUvBweFVUZE/Tq7Wm8kUNAkT1pHHgVl33Bw0rBU5gvAAcaXJJbUklmfST4DTJUczlr7blnlrAOqucwVugFD/uT@lists.infradead.org
X-Gm-Message-State: AFq9FYJhualMbN+ngwhsrMiA5zgxxoSOgJOagl7oOr0uhjflKs7VKZM7
	4vAfvdJveBcOh+pH3cekvA2qbbE9E5GJ2hIUl9mtSMn7Qq8MwFZiCnpYGfSa3TwQsrQ=
X-Gm-Gg: AYBFou0rfi28fsJRZF8557PojqDFqSqt/cQ5sWypQz0liH9hNJj7ET34PQ0zGEPCKw8
	CsvD4oo8Glxj+Tnb4UtLqLTiIUQn0tbmECwPxMZ+UpxO4rYgoCy4bAU2sta/WtGrJX5ocWqvrRI
	nhybEMAmK22CdyDDnclKKZh59mAWWMFJcK0C2LXi0F92GFIPn4yuVktUBpOtDcVvhdS9bgCxC36
	/RmSdwer2pkarGHjVuYreWRd7ynN+d2J0IsHFktrZOdbNyrAqWRHf4kdxguTffQClyEKdyAnf33
	YQWIHMZbK4uVzFFbHufGC62HVq8WgSUEGUWObw9/Io6wjjwpmYVyofwqm+BAxzXBGLXxF0s+UUh
	0EQSaDrPCyE7X2JpeKR2RZ63JZUCu1UjbDZ/jHRYqwZCwgT9NISj/rq/VTji9dx6VyEADnkD4Cu
	x58ILHYQxDEEQQvPBNb5TdYxXVu4BLeAR7vSZcqkZpUfKZ7UJGy5CLdoG4TP+LB+WpU3d81BMBn
	AIKW+EKXuF8U61EnA==
X-Received: by 2002:adf:f2cf:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48dbacf6ef6mr5914261f8f.53.1791626817764;
        Sat, 10 Oct 2026 03:06:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm7389151f8f.41.2026.10.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:06:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <179162681558.457042.13976808955805070898.b4-ty@b4>
Date: Sat, 10 Oct 2026 12:06:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_030702_775901_14730A16 
X-CRM114-Status: UNSURE (   3.92  )
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

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
      commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
